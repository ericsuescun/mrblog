class User < ApplicationRecord
	has_secure_password validations: false 	#This is because is gonna be encrypted
end
