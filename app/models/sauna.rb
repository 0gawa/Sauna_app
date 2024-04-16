class Sauna < ApplicationRecord
    has_one_attached :image

    has_many :tweets, dependent: :destroy
    belongs_to :sauna_info
    belongs_to :water
end
