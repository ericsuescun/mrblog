class User < ApplicationRecord
	has_secure_password validations: false 	#This is because is gonna be encrypted

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	validates :password, presence: true, on: :create
	validates :password, length: { in: 6..20 }, allow_nil: true
	validates :name, presence: true
end
