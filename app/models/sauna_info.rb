class SaunaInfo < ApplicationRecord
    belongs_to :sauna
    validates :temperature, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 150, message: "40度以上である必要があります" }
end
