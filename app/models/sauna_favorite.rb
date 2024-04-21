class SaunaFavorite < ApplicationRecord
    #これはサウナ施設に対するいいねです。
    belongs_to :sauna
    belongs_to :user

    validates :user_id, uniqueness: {scope: :sauna_id}
end
