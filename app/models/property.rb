class Property < ApplicationRecord
  # Association
  belongs_to :user

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
end
