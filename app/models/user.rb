class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[google_oauth2]

  has_one_attached :profile

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :sauna_favorites, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy
  has_many :sauna_comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20}
  validates :introduction, length: {maximum: 120}

  # for google login
  # validates :uid, uniqueness: { scope: :provider }

  def active_for_authentication?
    super && (is_unsubscribed == false)
  end

  def get_image(width, height)
    unless profile.attached?
      file_path = Rails.root.join('app/assets/images/user_no_image.png')
      profile.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    profile.variant(resize_to_fill: [width, height]).processed
  end

  #クラスメソッド
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.profile = auth.info.profile
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
  end
end
