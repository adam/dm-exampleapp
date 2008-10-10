class Tree
  include DataMapper::Resource
  property :id,   Serial
  property :name, String, :nullable => false

  belongs_to :parent, :class_name => 'Tree'
  has n, :children, :class_name => 'Tree'

  def self.setup
    bob = Tree.create(:name => 'bob')

    bob.children.create(:name => 'jim')
    bob.children.create(:name => 'steve')
    bob.children.create(:name => 'john')
  end
end
