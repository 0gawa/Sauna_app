RSpec.describe User, type: :model do
    it "ユーザー情報が正しいこと" do
        user = User.new(
            email: "test@test.com",
            password: "111111",
            name: "sauna"
        )
        expect(user.name+ "/" +
        user.email).to eq "sauna/test@test.com"
    end
end