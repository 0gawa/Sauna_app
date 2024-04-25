class Sauna < ApplicationRecord
    has_one_attached :image

    has_many :tweets, dependent: :destroy
    has_many :sauna_favorites, dependent: :destroy
    belongs_to :sauna_info
    belongs_to :water


    validates :name, presence: true
    validates :address, presence: true
    validates :sauna_info_id, presence: true
    validates :water_id, presence: true

    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/sauna_no_image.png')
          image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
        end
        image.variant(resize_to_fill: [width, height]).processed
    end

    def self.search(keyword)
      if keyword != ""
        Sauna.where('name LIKE(?)', "%#{keyword}%")
      else

      end
    end

    def sauna_favorited_by?(user)
      sauna_favorites.exists?(user_id: user.id)
    end
end
