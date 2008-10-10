class Person
  include DataMapper::Resource
  property :id, Integer, :serial => true
end
