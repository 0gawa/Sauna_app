class Public::ContactsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

  def contact_params
    params.requier(:contact).permit(:name, :email, :phone_number, :subject, :content,
                                    :prefecture, :address, :type,)

end
