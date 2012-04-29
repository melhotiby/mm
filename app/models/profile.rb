class Profile
  include Mongoid::Document
  field :address, :type => String
  field :about_me, :type => String
end
