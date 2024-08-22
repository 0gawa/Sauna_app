class Batch::InactiveUserDestroy
    def self.user_destroy
        p "退会済みユーザーの削除を始めます。"
        success = 0
        error = 0
        users = User.where(is_unsubscribed: true)
        users.each do |user|
            if user.destroy
                success += 1
            else
                error += 1
            end
        end
      p "#{success}件の退会済みユーザーを削除しました。"
      p "エラーは#{error}件発生しました。"
    end
end