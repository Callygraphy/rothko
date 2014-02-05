class Profile
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :body, Text
  # property :picture, Text, :auto_validation => false

  mount_uploader :picture, Uploader
end
