module LoginMacros
    def sign_up(user)
        visit new_user_registration_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in "user[password_confirmation]", with: user.password
        fill_in 'user[name]', with: user.name
        click_button '登録'
    end

    def log_in(user)
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end
end