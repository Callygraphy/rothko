migration 4, :create_events do
  up do
    create_table :events do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :body, DataMapper::Property::Text
    end
  end

  down do
    drop_table :events
  end
end
