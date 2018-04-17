class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :group_users
  has_many :groups,through: :group_users

  def group_usered_by?(group)
    group_users.where(group_id: group.id).exists?
  end

  acts_as_paranoid# column_type: 'boolean'

end

