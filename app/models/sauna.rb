class Sauna < ApplicationRecord
    has_one_attached :image

    has_many :tweets, dependent: :destroy
    has_many :sauna_infos, dependent: :destroy
    has_many :waters, dependent: :destory
end
