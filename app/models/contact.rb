class Contact < ApplicationRecord
    has_one_attached :image

    belongs_to :user

    validates :user_id, presence: true
    validates :subject, presence: true
    validates :content, presence: true

    enum is_read: {unread: 0, handle: 1, complete: 2}, _prefix: true
    enum type: {new: 0, contact: 1}, _prefix: true

    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/user_no_image.png')
          image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
        end
        image.variant(resize_to_fill: [width, height]).processed
    end
end
