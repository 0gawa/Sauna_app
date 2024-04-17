class Public::SaunasController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @sauna = Sauna.find(params[:id])
  end

  def index
  end

end
