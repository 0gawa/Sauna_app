class Admin::HomesController < ApplicationController
  def top
    @managers = Manager.all
  end
end
