require 'bcrypt'

class User < ApplicationRecord
include BCrypt

has_secure_password 

has_many :posts, dependent: :destroy

has_many :authentications, dependent: :destroy

validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

validates :password, confirmation: { case_sensitive: true }

 def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        name: auth_hash["extra"]["raw_info"]["name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        gender: auth_hash["extra"]["raw_info"]["gender"],
        birthday: auth_hash["extra"]["raw_info"]["birthday"],
        country: auth_hash["extra"]["raw_info"]["homwtown"],
        #image: auth_hash["extra"]["info"]["image"],
        password: SecureRandom.hex(5)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

GENDER_TYPES = ["Male", "Female", "Others"]

#  mount_uploaders :photos, PhotoUploader
 #  serialize :photos, JSON
  # belongs_to :user
   #validates :photos, presence: true

end  