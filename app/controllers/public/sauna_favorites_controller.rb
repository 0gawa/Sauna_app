class Public::SaunaFavoritesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        sauna = Sauna.find(params[:sauna_id])
        favorite = current_user.sauna_favorites.new(sauna_id: sauna.id)
        favorite.save
        render turbo_stream: turbo_stream.update("sauna_#{sauna.id}_favorite", partial: 'public/favorites/btn_sauna', locals: {sauna: sauna })
    end
  
    def destroy
        sauna = Sauna.find(params[:sauna_id])
        favorite = current_user.sauna_favorites.find_by(sauna_id: sauna.id)
        favorite.destroy
        render turbo_stream: turbo_stream.update("sauna_#{sauna.id}_favorite", partial: 'public/favorites/btn_sauna', locals: {sauna: sauna })
    end
end
