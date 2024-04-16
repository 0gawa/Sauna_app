class Water < ApplicationRecord
    has_many :saunas, dependent: :destroy
end
