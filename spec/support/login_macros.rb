module LoginMacros
    def sign_up(user)
        visit new_user_registration_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        fill_in "確認用", with: user.password
        fill_in 'ニックネーム（他のユーザーにも公開されます）', with: user.name
        click_button '登録'
    end
end