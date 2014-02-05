migration 3, :create_profiles do
  up do
    create_table :profiles do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :body, DataMapper::Property::Text
    end
  end

  down do
    drop_table :profiles
  end
end
