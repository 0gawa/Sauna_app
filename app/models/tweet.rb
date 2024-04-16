class Tweet < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :sauna

    validates :user_id, presence: true
    validates :sauna_id, presence: true

    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/user_no_image.png')
          image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
        end
        image.variant(resize_to_limit: [width, height]).processed
      end
end
