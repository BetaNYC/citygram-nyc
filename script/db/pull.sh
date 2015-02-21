#! /bin/bash
set -e
DUMP="tmp/${1}.dump"
LOCAL_DATABASE="citygram_development"

if [ ! -e $DUMP ]
then
  heroku pgbackups:capture --expire -a $1
  curl -o $DUMP `heroku pgbackups:url -a $1`
else
  echo "Using existing $DUMP"
fi

bundle exec rake db:drop db:create

pg_restore --no-acl --no-owner -h localhost -d $LOCAL_DATABASE $DUMP

# We don't need or want subscription information locally
psql -d $LOCAL_DATABASE -c "DELETE FROM subscriptions;"
pg_dump -Fc --no-acl --no-owner $LOCAL_DATABASE > $DUMP
