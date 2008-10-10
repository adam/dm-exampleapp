class Fruit
  include DataMapper::Resource
  storage_names[:default] = 'frt' # equivalent to set_table_name in AR
  property :id, Integer, :serial => true
  property :name, String, :field => 'col2'
end
