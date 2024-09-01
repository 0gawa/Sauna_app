require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '#user_mailer' do
    subject(:mail) do
      described_class.welcome_email.deliver_now
      ActionMailer::Base.deliveries.last
    end

    context 'when send_mail' do
      it { expect(mail.subject).to eq('サウナ探検隊のメンバーへようこそ！') }
    end
  end
end
