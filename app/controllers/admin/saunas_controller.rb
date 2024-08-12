class Admin::SaunasController < ApplicationController
    before_action :authenticate_manager!

    def new
        @sauna = Sauna.new
        10.times { @sauna.sauna_infos.build }
        10.times { @sauna.waters.build }
    end

    def show
        @sauna = Sauna.find(params[:id])
    end

    def index
        @saunas= Sauna.all
    end

    def edit
        @sauna=Sauna.find(params[:id])
        count_saunas=@sauna.sauna_infos.count
        count_waters=@sauna.waters.count
        (10-count_saunas).times { @sauna.sauna_infos.build }
        (10-count_waters).times { @sauna.waters.build }
    end

        #createとupdateはadminのみ
    def create
        @sauna = Sauna.new(sauna_params)
        if @sauna.name!="" && @sauna.address!=""
            @sauna.save
            redirect_to admin_sauna_path(@sauna.id)
        else
            flash[:danger]="名前、住所、サウナ・水風呂の温度は必ず入力してください"
            redirect_to new_admin_sauna_path
        end
    end

    def update
        @sauna=Sauna.find(params[:id])
        if @sauna.update(sauna_params)
            redirect_to admin_sauna_path(@sauna.id)
        else
        flash[:danger]="名前、住所、サウナ・水風呂の温度は必ず入力してください"
        redirect_to edit_admin_sauna_path(@sauna.id)
        end
    end
    #ここから上はadminの機能

    def destroy
        sauna=Sauna.find(params[:id])
        sauna.destroy
        redirect_to admin_saunas_path
    end

    private

    def sauna_params
        params.require(:sauna).permit(:name, :address ,:image, :express, :hp, :charge, :time,
        sauna_infos_attributes: [:id, :sauna_id, :temperature, :_destroy],
        waters_attributes: [:id, :sauna_id, :temperature, :_destroy])
    end
end
