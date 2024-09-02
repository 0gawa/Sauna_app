require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '#welcome_email' do
    # subject(:mail) do
    #   user = User.create(
    #     email: "a@a.com",
    #     password: "111111",
    #     name: "test"
    #   )  
    #   Public::RegistrationsController.sign_up(user)
    #   mail(to: user.email, subject: 'サウナ探検隊のメンバーへようこそ！')
    # end

    # context 'when send_mail' do
    #   it { expect(mail.subject).to eq('サウナ探検隊のメンバーへようこそ！') }
    # end
  end
end
