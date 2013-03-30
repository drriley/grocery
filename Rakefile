#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Grocery::Application.load_tasks

require 'single_test'
SingleTest.load_tasks

# to run a single unit test, just do rake test:model; e.g., rake test:store or rake test:company