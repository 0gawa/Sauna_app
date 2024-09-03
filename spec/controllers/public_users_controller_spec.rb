require 'rails_helper'

RSpec.describe Public::UsersController, type: :controller do
    describe "ユーザーコントローラーに関して" do
        #ユーザーが保存されていたらすべて削除する
        if User.all.count >= 0
            User.all.each do |user|
                user.destroy
            end
        end
        #ユーザー１、２を作成する
        let(:user) { create(:user) }
        let!(:other_user) { create(:user) }

        before do
            sign_in user
        end
        
        it "ログインできる" do
            visit user_path(user.id)
            expect(page).to have_content 'マイページ'
        end
        
        context "ページが正しく表示されるか" do
            it "mypage：マイページ" do
                visit user_path(user.id)
                expect(page).to have_content 'マイページ'
            end
        end

        context "ユーザー編集ができる" do
            it "名前を変更する" do
                visit edit_user_path(user.id)
                fill_in 'user[name]', with: "test(edited)"
                click_button '保存する'
                expect(@user.name).to eq "test(edited)"
            end
        end

    end
end
