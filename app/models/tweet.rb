class Tweet < ApplicationRecord
    has_one_attached :image

    validates :user_id, uniqueness: {scope: :tweet_id}
end
