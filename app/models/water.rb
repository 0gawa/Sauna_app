class Water < ApplicationRecord
    belongs_to :sauna
    validates :temperature, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 40}
end
