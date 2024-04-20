class Favorite < ApplicationRecord
    #これは投稿に対するいいねです
    belongs_to :user
    belongs_to :tweet

    validates :user_id, uniqueness: {scope: :tweet_id}
end
