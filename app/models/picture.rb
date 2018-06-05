class Picture < ApplicationRecord
  mount_uploader :image, AvatarUploader
  belongs_to :pictureable, polymorphic: true
end
