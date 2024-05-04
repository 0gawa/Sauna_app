class Water < ApplicationRecord
    has_many :saunas, dependent: :destroy
    has_many :number_waters, dependent: :destroy
end
