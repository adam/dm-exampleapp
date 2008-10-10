class Exhibit
  include DataMapper::Resource
  property :id, Serial
  property :name, String

  belongs_to :zoo

  def self.setup
    san_diego = Zoo.first(:name => 'San Diego Zoo')
    Exhibit.create(:name => 'Pandas', :zoo => san_diego)
    Exhibit.create(:name => 'Cheetas', :zoo => san_diego)
    Exhibit.create(:name => 'Lions', :zoo => san_diego)

    woodland_park = Zoo.first(:name => 'Woodland Park Zoo')
    Exhibit.create(:name => 'Wolves', :zoo => woodland_park)
    Exhibit.create(:name => 'Sea Otters', :zoo => woodland_park)

    oregon_zoo = Zoo.first(:name => 'Oregon Zoo')
    Exhibit.create(:name => 'Elephants', :zoo => oregon_zoo)
    Exhibit.create(:name => 'Cheetas', :zoo => oregon_zoo)
    Exhibit.create(:name => 'Zebras', :zoo => oregon_zoo)
    Exhibit.create(:name => 'Bears', :zoo => oregon_zoo)
  end
end
