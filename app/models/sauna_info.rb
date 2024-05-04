class SaunaInfo < ApplicationRecord
    has_many :saunas, dependent: :destroy
    has_many :number_saunas, dependent: :destroy
end
