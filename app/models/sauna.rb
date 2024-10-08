class Sauna < ApplicationRecord
    geocoded_by :address
    after_validation :geocode

    has_one_attached :image

    has_many :tweets, dependent: :destroy
    has_many :sauna_favorites, dependent: :destroy
    has_many :sauna_comments, dependent: :destroy
    has_many :sauna_infos, dependent: :destroy
    accepts_nested_attributes_for :sauna_infos, allow_destroy: true, reject_if: :all_blank, limit: 10
    has_many :waters, dependent: :destroy
    accepts_nested_attributes_for :waters, allow_destroy: true, reject_if: :all_blank, limit: 10

    validates :name, presence: true
    validates :address, presence: true

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
