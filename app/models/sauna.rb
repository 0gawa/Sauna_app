class Sauna < ApplicationRecord
    has_one_attached :image

    has_many :tweets, dependent: :destroy
    belongs_to :sauna_info
    belongs_to :water

    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/sauna_no_image.png')
          image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
        end
        image.variant(resize_to_fill: [width, height]).processed
    end
end
