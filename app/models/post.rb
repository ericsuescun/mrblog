class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	default_scope -> { order(created_at: :desc) }	#It's used to always bring things from de DB with descending order
	
	validates :title, presence: true
	validates :content, presence: true, length: { minimum: 250 }
end
