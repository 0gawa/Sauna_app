class Tweet < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :sauna

    validates :user_id, uniqueness: {scope: :tweet_id}

end
