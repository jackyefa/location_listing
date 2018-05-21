class VerificationCode < ApplicationRecord
  has_secure_token :verify_token
end
