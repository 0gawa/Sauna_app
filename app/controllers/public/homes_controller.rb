class Public::HomesController < ApplicationController
    before_action :authenticate_user!, except: [:top]
    
    def top
        @saunas = Sauna.all
    end 
end
