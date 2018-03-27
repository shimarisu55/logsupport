class Blog < ApplicationRecord

	belongs_to :user
	default_scope -> { order(created_at: :desc) }

    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy

    # before_action  :favorited_by?(user)

	# def self.search(search) #self.でクラスメソッドとしている
	# 	if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	# 	  # binding.pry
	# 	  Blog.where(['name LIKE ?', "%#{search}%"])
	# 	else
	# 	  Blog.all #全て表示。
	# 	end
	# end

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
      # redirect_to  new_user_session_path
    end

	validates :header, presence: true
	validates :author, presence: true
	validates :source, presence: true
	validates :claim1, presence: true, length: { maximum: 15}
	validates :claim2, presence: true, length: { maximum: 15}
	validates :basis1, length: { maximum: 15}
	validates :basis2, length: { maximum: 15}
	validates :example1, length: { maximum: 15}
	validates :example2, length: { maximum: 15}
	validates :body, presence: true, length: { minimum: 10}



end
