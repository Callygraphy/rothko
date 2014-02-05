migration 5, :create_chapters do
  up do
    create_table :chapters do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :body, DataMapper::Property::Text
    end
  end

  down do
    drop_table :chapters
  end
end
