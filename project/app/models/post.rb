class Post < ApplicationRecord

validates :photos, presence: true
mount_base64_uploader :image, ProductImageUploader

end

