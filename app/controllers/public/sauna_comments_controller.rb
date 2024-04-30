class Public::SaunaCommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        sauna = Sauna.find(params[:sauna_id])
        comment = current_user.sauna_comments.new(sauna_comment_params)
        comment.sauna_id = sauna.id
        comment.save
        redirect_to sauna_path(sauna.id)
    end
    
    private
    
    def sauna_comment_params
        params.require(:sauna_comment).permit(:comment, :aufguss, :autorolly, :air_bath, :whisking, :restaurant, :water)
    end
end
