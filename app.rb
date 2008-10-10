#!/usr/bin/env ruby
require 'rubygems'
require 'dm-core'

DataMapper.setup :default, "sqlite3:///tmp/dm-exampleapp.sqlite3.db"

puts <<-EOF

Welcome to the DM Example application.  This script demonstrates the concepts shown at

http://datamapper.org


EOF
