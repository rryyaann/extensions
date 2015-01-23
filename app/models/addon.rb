class Addon < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true
	validates :explanation, presence: true
	validates :category, presence: true 
	validates :url, presence: true 

	has_many :reviews
end
