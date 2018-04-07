class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :blog
	default_scope -> { order(created_at: :desc) }
end
