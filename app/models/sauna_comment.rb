class SaunaComment < ApplicationRecord
    validates :comment, presence: true

    belongs_to :user
    belongs_to :sauna

    enum aufguss: {na: 0, yes: 1, no: 2 }, _prefix: true
    enum autorolly: {na: 0, yes: 1, rolly: 2, no: 3}, _prefix: true
    enum air_bath: {na: 0, yes: 1, no: 2 }, _prefix: true
    enum whisking: {na: 0, yes: 1, no: 2 }, _prefix: true
    enum restaurant: {na: 0, yes: 1, no: 2 }, _prefix: true
    enum water: {na: 0, yes: 1, no: 2 }, _prefix: true

end
