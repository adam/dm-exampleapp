class Tree
  include DataMapper::Resource
  property :id,   Integer, :serial => true
  property :name, String, :nullable => false

  belongs_to :parent, :class_name => 'Tree'
  has n, :children, :class_name => 'Tree'
end
