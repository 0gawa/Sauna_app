require 'rails_helper'

RSpec.describe Public::UsersController, type: :controller do
    describe "ユーザーコントローラーに関して" do
        let(:user) { create(:user) }
        let(:other_user) { create(:user) }
        before do
            log_in(user)
        end

        context "ページが正しく表示されるか" do
            it "マイページ" do
                visit user_path(user.id)
                expect(page).to have_content 'マイページ'
            end

            it "退会確認" do
                visit unsubscribe_path
                expect(page).to have_content '退会の確認'
            end

            it "ユーザー編集画面" do
                visit edit_user_path(user)
                expect(page).to have_content "ユーザー情報の編集"
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
