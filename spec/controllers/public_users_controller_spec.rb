require 'rails_helper'

RSpec.describe Public::UsersController, type: :controller do
    describe "ユーザーコントローラーに関して" do
        before do
            @user = User.create!(name: "test", email: "1111@gmail.com", password: "111111")
            sign_up(@user)
        end
    
        context "ユーザー編集ができる" do
            it "名前を変更する" do
                visit edit_user_path(@user.id)
                fill_in 'user[name]', with: "test(edited)"
                click_button '保存する'
                expect(@user.name).to eq "test(edited)"
            end
        end

        context "ページが正しく表示されるか" do
            it "mypage：マイページ" do
                
            end
        end
    end
end
