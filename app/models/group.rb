class Group < ApplicationRecord

	attachment :image
	has_many :group_users, dependent: :destroy
	has_many :users,through: :group_users
	accepts_nested_attributes_for :group_users, allow_destroy: true

	def group_usered_by?(user)
      group_users.where(user_id: user.id).exists?
    end
end
