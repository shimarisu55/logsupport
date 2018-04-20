class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :blog
	default_scope -> { order(created_at: :desc) }

	paginates_per 12  # 1ページあたり5項目表示
end
