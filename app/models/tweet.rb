class Tweet < ApplicationRecord
    has_one_attached :image

    has_many :favorites, dependent: :destroy
    has_many :tweet_comments, dependent: :destroy
    belongs_to :user
    belongs_to :sauna

    validates :impression, length: { maximum: 500 }
    validates :user_id, presence: true
    validates :sauna_id, presence: true
    validates :count, presence: true
    validates :sauna_time, presence: true
    validates :water_time, presence: true
    validates :totonoi_time, presence: true

    scope :for_month, -> {where(created_at: Time.current.all_month)}

    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/tweet_no_image.png')
          image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
        end
        image.variant(resize_to_fill: [width, height]).processed
    end

    #引数で渡されたユーザのidがFavoriteモデルに存在するかチェック
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end
end
