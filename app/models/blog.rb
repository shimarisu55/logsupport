class Blog < ApplicationRecord

	belongs_to :user
	default_scope -> { order(created_at: :desc) }

    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

	validates :header, presence: true
	validates :author, presence: true
	validates :source, presence: true
	validates :claim1, presence: true
	validates :claim2, presence: true
	validates :body, presence: true, length: { minimum: 10}

end
