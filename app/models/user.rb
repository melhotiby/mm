class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  GENRE = ['Male', 'Female']
  
  before_create :generate_lat_long
  before_update :generate_lat_long
  
  has_many :relationships
  
  protected
  
  def generate_lat_long
    require 'geo'
    lat, lng = Geo::get_coords("#{self.city} #{self.state}")
    self.latitude = lat
    self.longitude = lng
  end
  
end
