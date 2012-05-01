class User
  
  GENRE = ['Male', 'Female']
  
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :first_name,         :type => String, :null => false, :default => ""
  field :last_name,          :type => String, :null => false, :default => ""
  field :email,              :type => String, :null => false, :default => ""
  field :encrypted_password, :type => String, :null => false, :default => ""
  field :birthday, :type => Date
  field :genre, :type => String
  field :interested, :type => String
  field :country, :type => String
  field :state, :type => String
  field :city, :type => String
  field :terms, :type => Boolean
  field :latitude, :type => String
  field :longitude, :type => String
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
  
  validates_presence_of, 

  before_create :generate_lat_long

  protected
  
  def generate_lat_long
    require 'geo'
    lat, lng = Geo::get_coords("#{self.city} #{self.state}")
    self.latitude = lat
    self.longitude = lng
  end
  
end
