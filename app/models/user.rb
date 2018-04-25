class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable,
       :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable


  attachment :image
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :group_users
  has_many :groups,through: :group_users

  def group_usered_by?(group)
    group_users.where(group_id: group.id).exists?
  end
acts_as_paranoid

#引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
   def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
      )
    end
 
    user
  end
 
  private
 
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end

