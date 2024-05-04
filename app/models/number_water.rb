class NumberWater < ApplicationRecord
    #このモデルはサウナ施設が複数のサウナを持てるようにするため

    belongs_to :sauna
    belongs_to :water
end
