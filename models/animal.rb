class Animal
  include DataMapper::Resource
  property :id, Integer, :serial => true
  property :name, String
  property :notes, Text, :lazy => false
end
