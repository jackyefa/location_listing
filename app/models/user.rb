class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  # validation  
  validates :name, presence: true
  validates :email, format: { with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/, message: "invalid"}
end
