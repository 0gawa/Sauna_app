require "rails_helper"

RSpec.describe User, type: :model do
    describe "Userモデルのチェック" do
        context "バリデーションチェック" do
            it "nameの文字数制限:1文字" do
                user=User.new(name:"", email:"a@a.com", password:"111111")
                expect(user).to be_invalid
            end
            it "nameの文字数制限:21文字" do
                name="aaaaaaaaaaaaaaaaaaaaaaa"
                user=User.new(name: name, email:"a@a.com", password:"111111")
                expect(user).to be_invalid
            end
            it "自己紹介のバリデーション" do
                intro=""
                121.times do |n|
                    intro += "a"
                end
                user=User.new(name: "test", email:"a@a.com", password:"111111", introduction: intro)
                expect(user).to be_invalid

                user=User.new(name: "test", email:"a@a.com", password:"111111", introduction: "test")
                expect(user).to be_valid
            end
        end
    end
end