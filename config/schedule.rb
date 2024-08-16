# Use this file to easily define all of your cron jobs.
#
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
set :environment, rails_env
set :output, 'log/cron.log'

every :month do
  begin
    runner "Batch::InactiveUserDestroy.user_destroy"
  rescue => e
    Rails.logger.error("aborted rails runner：エラーが発生しました")
    raise e
  end
end