class NumberSauna < ApplicationRecord
    #このモデルはサウナ施設が複数のサウナを持てるようにするため

    belongs_to :sauna
    belongs_to :sauna_info
end
