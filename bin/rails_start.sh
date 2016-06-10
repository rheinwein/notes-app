#!/bin/bash

TIMEOUT=60
COUNT=0
until pg_isready -h $DB_1_PORT_5432_TCP_ADDR -U postgres || [ $COUNT -eq $TIMEOUT ];
do
  echo $COUNT
  echo $TIMEOUT
  sleep 1
  COUNT=$((COUNT+1))
done

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

rails s -b '0.0.0.0'
