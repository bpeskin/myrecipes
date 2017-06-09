class Comment < ApplicationRecord

	validates :description, presence: true, length: { maximum: 200 }
	belongs_to :chef
	validates :chef_id, presence: true
	belongs_to :recipe
	validates :recipe_id, presence: true
	default_scope -> { order(created_at: :desc) }
	
end