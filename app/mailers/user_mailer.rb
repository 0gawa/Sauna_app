class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url  = "https://sauna-tankentai.daiki-portfolio.site/users/sign_in"
        mail(to: @user.email, subject: 'サウナ探検隊のメンバーへようこそ！')
    end
end
