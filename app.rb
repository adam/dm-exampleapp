#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'dm-core'

autoload :Animal, 'models' / 'animal'
autoload :Dragon, 'models' / 'dragon'
autoload :Fruit,  'models' / 'fruit'
autoload :Person, 'models' / 'person'
autoload :Tree,   'models' / 'tree'
autoload :Zoo,    'models' / 'zoo'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup :default, 'sqlite3::memory:'

[ Animal, Dragon, Fruit, Person, Tree, Zoo ].each { |m| m.auto_migrate! }

Tree.setup

puts <<-EOF

Welcome to the DM Example application.  This script demonstrates the concepts shown at

http://www.datamapper.org/why.html

EOF

puts 'Identity Map'

repository do
  @parent = Tree.first(:conditions => ['name = ?', 'bob'])

  @parent.children.each do |child|
    puts @parent.object_id == child.parent.object_id
  end
end
