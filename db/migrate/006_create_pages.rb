migration 6, :create_pages do
  up do
    create_table :pages do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :body, DataMapper::Property::Text
    end
  end

  down do
    drop_table :pages
  end
end
