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

  #問い合わせフォームにするアクション
  def contact
    form = Contact.find(params[:id])
    form.type = 1

  end

  #サウナ施設の情報提供フォームにするアクション
  def information
    form = Contact.find(params[:id])
    form.type = 0
    
  end

  private

  def contact_params
    params.requier(:contact).permit(:name, :email, :phone_number, :subject, :content,
                                    :prefecture, :address, :type,)
  end
end
