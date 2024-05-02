class SaunaComment < ApplicationRecord
    # validates :comment, presence: true

    belongs_to :user
    belongs_to :sauna

    #naとはNot Answer
    enum aufguss: {na: 0, y: 1, n: 2 }, _prefix: true
    enum autorolly: {na: 0, y: 1, rolly: 2, n: 3}, _prefix: true
    enum air_bath: {na: 0, y: 1, n: 2 }, _prefix: true
    enum whisking: {na: 0, y: 1, n: 2 }, _prefix: true
    enum restaurant: {na: 0, y: 1, n: 2 }, _prefix: true
    enum water: {na: 0, y: 1, n: 2 }, _prefix: true
    enum parking: {na: 0, y: 1, n: 2 }, _prefix: true
    enum age: {na: 0, ut20: 1, ut30: 2, ut50: 3, ut70: 4}, _prefix: true

    validates :comment, length: { maximum: 300 }
end
