class Admin::HomesController < ApplicationController
  before_action :authenticate_manager!

  def top
    @managers = Manager.all
  end
  
end
