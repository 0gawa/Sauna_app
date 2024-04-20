class Admin::SaunasController < ApplicationController
    before_action :authenticate_manager!

    def new
        @sauna = Sauna.new
        @sauna_infos = SaunaInfo.all
        @water = Water.all
    end

    def show
        @sauna = Sauna.find(params[:id])
    end

    def index
        @saunas= Sauna.all
    end

    def create
        @sauna = Sauna.new(sauna_params)
        if @sauna.save
            redirect_to admin_sauna_path(@sauna.id)
        else
            @sauna_infos = SaunaInfo.all
            @water = Water.all
            render :new, status: :unprocessable_entity
        end
    end

    private

    def sauna_params
        params.require(:sauna).permit(:name, :sauna_info_id, :water_id, :address ,:image, :express)
    end
end
