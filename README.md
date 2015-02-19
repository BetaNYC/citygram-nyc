# Citygram [![Build Status](http://img.shields.io/travis/BetaNYC/citygram-nyc.svg)][travis] [![Dependency Status](http://img.shields.io/gemnasium/BetaNYC/citygram-nyc.svg)][gemnasium] [![Code Climate](http://img.shields.io/codeclimate/github/BetaNYC/citygram-nyc.svg)][codeclimate]

[travis]: https://travis-ci.org/BetaNYC/citygram-nyc
[gemnasium]: https://gemnasium.com/BetaNYC/citygram-nyc
[codeclimate]: https://codeclimate.com/github/BetaNYC/citygram-nyc

__Citygram__ is a geographic notification platform designed to work with open government data. It allows residents to designate area(s) of a city they are interested in and subscribe to one or more topics. When an event for a desired topic occurs in the subscriber's area of interest, a notification (email, SMS, or  [webhook](http://en.wikipedia.org/wiki/Webhook)) is delivered. Citygram is a [Code for America](https://github.com/codeforamerica) project by the [Charlotte](http://team-charlotte.tumblr.com/) and [Lexington](http://teambiglex.tumblr.com/) teams for the [2014 fellowship](http://www.codeforamerica.org/geeks/our-geeks/2014-fellows/).

### Why are we doing this?

We believe that there is an opportunity to help residents better understand what’s going on in their area, when it’s going to happen, and why. By providing timely information to residents in areas that are relevant to them, the city can be proactive instead of reactive, build trust through transparency, and increase civic engagement across the board.

### How to contribute
* You can file an [issue](https://github.com/BetaNYC/citygram-nyc/issues/new)
* Join in a conversation at [talk.beta.nyc/citygram](https://talk.beta.nyc/c/working-groups/citygram)

### Who is this made by?

See the [contributors list](https://github.com/betanyc/citygram-nyc/graphs/contributors).

### Technical Overview

Citygram is a web application written in Ruby.

* Web: [Sinatra](https://github.com/sinatra/sinatra), [Grape](https://github.com/intridea/grape), [Sprockets](https://github.com/sstephenson/sprockets)
* Web server: [Unicorn](http://unicorn.bogomips.org/)
* Database/models: [PostgreSQL](http://www.postgresql.org/), [PostGIS](http://postgis.net/), [Sequel](https://github.com/jeremyevans/sequel/)
* Job Queue: [Redis](http://redis.io/), [Sidekiq](https://github.com/mperham/sidekiq)
* Tests: [RSpec](https://github.com/rspec), [FactoryGirl](https://github.com/thoughtbot/factory_girl), [Rack::Test](https://github.com/brynary/rack-test)

### Setup

* Install Redis - `brew install redis`
* [Install PostgreSQL](https://github.com/codeforamerica/howto/blob/master/PostgreSQL.md)
* [Install Ruby](https://github.com/codeforamerica/howto/blob/master/Ruby.md)

In the command line, run the following:

```
git clone https://github.com/codeforamerica/citygram.git
cd citygram
cp .env.sample .env
gem install bundler
bundle install
rake db:create db:migrate
rake db:create db:migrate DATABASE_URL=postgres://localhost/citygram_test
rake # run the test suite
bundle exec rackup
```

### Usage

#### Development

```
bundle exec foreman start -f Procfile.dev
```

#### Production

This should work out of the box on [Heroku](https://heroku.com)

```
bundle exec foreman start
```

### Domain

#### City

These are loaded from 'config/geojson', static data, easy to understand.

#### Event

TODO

#### Publisher

In order for a city to show up it needs a publisher.

A publisher is a source of information, for example the NYC 311 service.

```
> bundle exec rake console
  DB[:publishers].insert(
    visible: true, active: true, \
    title: "311", tags: Sequel.pg_array(["new-york"]), \
    city: "new-york", icon: "phone.png" \
  )
```

[http://localhost:9292/new-york](http://localhost:9292/new-york)

#### Subscription

TODO
