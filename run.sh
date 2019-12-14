#!/bin/bash
python3 files.py 
bundle install \
 && bundle exec kitchen create \
 && bundle exec kitchen converge \
 && bundle exec kitchen verify  \
 && bundle exec kitchen destroy
