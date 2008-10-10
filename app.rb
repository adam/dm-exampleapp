#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'dm-core'

autoload :Animal,  'models' / 'animal'
autoload :Exhibit, 'models' / 'exhibit'
autoload :Person,  'models' / 'person'
autoload :Tree,    'models' / 'tree'
autoload :Zoo,     'models' / 'zoo'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup :default, 'sqlite3::memory:'

[ Animal, Exhibit, Person, Tree, Zoo ].each { |m| m.auto_migrate! }

Tree.setup
Animal.setup
Zoo.setup
Exhibit.setup

puts <<-EOF

Welcome to the DM Example application.  This script demonstrates the concepts shown at

http://www.datamapper.org/why.html

EOF

puts '-' * 80
puts 'Identity Map'

repository do
  @parent = Tree.first(:conditions => ['name = ?', 'bob'])

  @parent.children.each do |child|
    puts @parent.object_id == child.parent.object_id
  end
end

puts '-' * 80
puts 'Laziness Can Be A Virtue'

animals = Animal.all
animals.each do |pet|
  pet.notes
end

puts '-' * 80
puts 'Strategic Eager Loading'

zoos = Zoo.all
zoos.each do |zoo|
  # on first iteration, DM loads up all of the exhibits for all of the items in zoos
  # in 1 query to the data-store.
  zoo.exhibits.each do |exhibit|
    # n+1 queries in other ORMs, not in DataMapper
    puts "Zoo: #{zoo.name}, Exhibit: #{exhibit.name}"
  end
end
