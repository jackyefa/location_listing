class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  # validation  
  validates :name, presence: true
  validates :email, format: { with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/, message: "invalid"}, :uniqueness => { :case_sensitive => false }

  # Association
  has_many :properties

  # Instance Methods

  def properties_with_url(request)
    user_property = []
    properties.each do |property| 
      url = property.pictures.last.present? ? "#{request.host}#{property.pictures.last.image.url}" : "" 
      user_property << property.attributes.merge(url: url)
    end
    user_property
  end
end


