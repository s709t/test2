#!/bin/bash
bundle install \
 && bundle exec kitchen create \
 && bundle exec kitchen converge \
 && bundle exec kitchen verify  \
 && bundle exec kitchen destroy
