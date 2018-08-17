class Property < ApplicationRecord
  # Association
  belongs_to :user 
  has_many :pictures, as: :pictureable
  
  # Scope
  scope :all_except, ->(user) { where.not(user_id: user) }

  # Callback
  before_create :set_latitude_and_longitude, :unless => :lat_long_nil?

  def set_latitude_and_longitude
    full_address  = "#{address}, #{city}, #{state} #{zipcode}"
    5.times do |count|
      lat_long_array = Geocoder.coordinates(full_address)
      if lat_long_array.present?        
        self.latitude = lat_long_array.first
        self.longitude = lat_long_array.last
        break
      end
    end
  end

  def lat_long_nil?
    latitude.present? && longitude.present?
  end

  def self.all_property_except_user_property(user, request)
    properties = Property.all_except(user)
    all_property = []
    properties.each do |property|
      url = property.pictures.last.present? ? "#{request.host}#{property.pictures.last.image.url}" : "" 
      all_property << property.attributes.merge(url: url)
    end
    all_property
  end
end
