# citygram [![Build Status](http://img.shields.io/travis/codeforamerica/citygram.svg)][travis] [![Dependency Status](http://img.shields.io/gemnasium/codeforamerica/citygram.svg)][gemnasium] [![Code Climate](http://img.shields.io/codeclimate/github/codeforamerica/citygram.svg)][codeclimate]

[travis]: https://travis-ci.org/codeforamerica/citygram
[gemnasium]: https://gemnasium.com/codeforamerica/citygram
[codeclimate]: https://codeclimate.com/github/codeforamerica/citygram

__Citygram__ (still a working title, previously known as "georelevent") is a geographically relevant notification platform for cities. It allows citizens to designate geographic area(s) they are interested in, subscribe to specific topics, and and delivers information to citizens when something they’ve subscribed to happens in their area. Citygram is a [Code for America](https://github.com/codeforamerica) project by the [Charlotte Team](http://team-charlotte.tumblr.com/) for the [2014 fellowship](http://www.codeforamerica.org/geeks/our-geeks/2014-fellows/).

### Why are we doing this?

We believe that there is an opportunity to help citizens better understand what’s going on in their area, when it’s going to happen, and why. By providing timely information to citizens in areas that are relevant to them, the city can be proactive instead of reactive, build trust through transparency, and increase civic engagement across the board.

### What does this do now?

TODO

### What will this do in the future?

TODO

### Who is this made by?
- [Danny Whalen](https://github.com/invisiblefunnel)
- [Tiffany Chu](https://github.com/tchu88)
- [Andrew Douglass](https://github.com/ardouglass)

### Setup

* Install Redis - `brew install redis`
* [Install PostgreSQL](https://github.com/codeforamerica/howto/blob/master/PostgreSQL.md)
* [Install Ruby](https://github.com/codeforamerica/howto/blob/master/Ruby.md)

```
git clone https://github.com/codeforamerica/citygram.git
cd citygram
cp .env.sample .env
gem install bundler
bundle install
rake db:create db:migrate
rake db:create db:migrate DATABASE_URL=postgres://localhost/citygram_test
rake # run the test suite
bundle exec foreman start -f Procfile.dev
```
