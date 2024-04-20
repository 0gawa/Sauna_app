class Public::SaunaFavoritesController < ApplicationController
    def create
        sauna = Sauna.find(params[:sauna_id])
        favorite = current_user.sauna_favorites.new(sauna_id: sauna.id)
        favorite.save
        redirect_to sauna_path(sauna.id)
    end
  
    def destroy
        sauna = Sauna.find(params[:sauna_id])
        favorite = current_user.sauna_favorites.find_by(sauna_id: sauna.id)
        favorite.destroy
        redirect_to sauna_path(sauna.id)
    end
end
