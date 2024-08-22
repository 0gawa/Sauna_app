require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
set :environment, rails_env
set :output, 'log/cron.log'

every 1.month do
  begin
    runner "Batch::InactiveUserDestroy.user_destroy"
  rescue => e
    Rails.logger.error("aborted rails runner：エラーが発生しました")
    raise e
  end
end