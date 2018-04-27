class Group < ApplicationRecord

	has_many :group_users, dependent: :destroy
	has_many :users,through: :group_users
	accepts_nested_attributes_for :group_users, allow_destroy: true

	 has_attached_file :image,
# PaperClip用の設定
     :styles => {
                      :thumb  => "100x100",
                      :medium => "200x200",
                      :large => "600x400"
                    },

# S3用の設定
:storage => :s3,
:s3_credentials => "#{Rails.root}/config/s3.yml",
:path => ":attachment/:id/:style.:extension"

	def group_usered_by?(user)
      group_users.where(user_id: user.id).exists?
    end
end
