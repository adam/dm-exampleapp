class Zoo
  include DataMapper::Resource
  property :id, Serial
  property :name, String

  has n, :exhibits

  def self.setup
    Zoo.create(:name => 'San Diego Zoo')
    Zoo.create(:name => 'Woodland Park Zoo')
    Zoo.create(:name => 'Oregon Zoo')
  end
end
