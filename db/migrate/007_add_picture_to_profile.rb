migration 7, :add_picture_to_profile do
  up do
  	modify_table :profiles do
  	  add_column :picture, DataMapper::Property::Text
  	end 
  end

  down do
  	modify_table :profiles do
  	  drop_column :picture
  	end 
  end
end
