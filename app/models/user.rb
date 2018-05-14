class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable,
       :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

 # if Rails.env.production?
 #   S3_CREDENTIALS={access_key_id: "AKIAI2TH5FVATIGKMCHA", secret_access_key: "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",
 #    bucket:"logsupport-com", s3_host_name: "s3-ap-northeast-1.amazonaws.com"}#東京の場合
 # end

 # if Rails.env.production?
 # has_attached_file :image, storage: :s3, s3_credentials: S3_CREDENTIALS,
 # styles: { medium: "300x300!", thumb: "100x100!>"}, path:":attachment/:id/:style.:extension"
 # else
 #   has_attached_file :image, styles: { medium: "300x300!", thumb: "100x100!>"}
 # end


#  attachment :image
# has_attached_file :image,
# PaperClip用の設定
#:styles => {
#                      :thumb  => "100x100",
#                      :medium => "200x200",
#                      :large => "600x400"
#                    },

# S3用の設定
#:storage => :s3,
#:s3_credentials => "#{Rails.root}/config/s3.yml",
#:path => ":attachment/:id/:style.:extension"

#validates_attachment :image, content_type: { content_type: "image/jpg" }


  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :group_users
  has_many :groups,through: :group_users

  default_scope -> { order(created_at: :desc) }

  def group_usered_by?(group)
    group_users.where(group_id: group.id).exists?
  end
  # 退会処理用のgemです。
acts_as_paranoid

# twitterのソーシャルログイン時にユーザーを自動で作ります。
#引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
   def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
#        email:    auth.info.email,
        password: Devise.friendly_token[0, 20],
 #       image: auth.info.image,
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

