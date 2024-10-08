class Public::SaunaCommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        sauna = Sauna.find(params[:sauna_id])
        comment = SaunaComment.new(sauna_comment_params)
        comment.user_id = current_user.id
        comment.sauna_id = sauna.id
        
        cnt=0   #何かしらに答えているかを確認するためのカウンタ
        if comment.aufguss != "na"; cnt+=1 end
        if comment.autorolly != "na";cnt+=1 end
        if comment.air_bath != "na"; cnt+=1 end
        if comment.whisking != "na"; cnt+=1 end
        if comment.water != "na"; cnt+=1 end
        if comment.restaurant != "na"; cnt+=1 end
        if comment.parking != "na"; cnt+=1 end
        if comment.age != "na"; cnt+=1 end
        if comment.comment != ""; cnt+=1 end
        
        if cnt >= 1
          comment.save
          flash[:success] = "送信に成功しました。"
          redirect_to sauna_path(sauna.id)
        else
          @sauna = sauna
          @sauna_comments = @sauna.sauna_comments.all.page(params[:page]).per(20)
          @sauna_comment = comment
          saunas = Sauna.includes(:sauna_favorites).sort_by { |sauna| -sauna.sauna_favorites.count }
          @saunas = saunas[0..15]
          @lat_lon = Geocoder.coordinates(@sauna.address)
          if @lat_lon.nil?
            @lat_lon = [35.6759323, 139.7450316]
          end
          flash.now[:danger] = "以下の項目に1つ以上回答してください。"
          render "public/saunas/show", status: :unprocessable_entity
        end
    end
    
    private
    
    def sauna_comment_params
        params.require(:sauna_comment).permit(:comment, :aufguss, :autorolly, :air_bath, :whisking, :restaurant, :water, :parking, :age)
    end
end
