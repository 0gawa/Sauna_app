class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :sauna_favorites, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy

  validates :name, presence: true
  #validates :introduction, presence: true

  def get_image(width, height)
    unless profile.attached?
      file_path = Rails.root.join('app/assets/images/user_no_image.png')
      profile.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    profile.variant(resize_to_fill: [width, height]).processed
  end
end
