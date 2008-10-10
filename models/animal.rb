class Animal
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :notes, Text, :lazy => true

  def self.setup
    Animal.create(:name => 'Dog',  :notes => "Man's best friend")
    Animal.create(:name => 'Cat',  :notes => "Woman's best friend")
    Animal.create(:name => 'Lion', :notes => 'King of the Jungle')
  end
end
