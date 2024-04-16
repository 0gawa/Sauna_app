class SaunaInfo < ApplicationRecord
    has_many :saunas, dependent: :destroy
end
