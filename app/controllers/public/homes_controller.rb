class Public::HomesController < ApplicationController
    before_action :authenticate_user!, except: [:top, :privacy_policy]
    
    def top
        @saunas = Sauna.all
    end 

    def privacy_policy
    end
end
