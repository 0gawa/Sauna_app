10.times do |n|
    Sauna.create!(
      name: "サウナ施設 No.#{n + 1}",
      address: "東京都#{n + 1}丁目"
    )
    SaunaInfo.create!(
        temperature: n+90,
        sauna_id: n+1
    )
    Water.create!(
        temperature: n+10,
        sauna_id: n+1
    )
end

10.times do |n|
    SaunaInfo.create!(
        temperature: n+100,
        sauna_id: n+1
    )
    Water.create!(
        temperature: n+14,
        sauna_id: n+1
    )
end

#これは仮の管理者
Manager.create!(
    email: "kanrisya@sample.com",
    name: "kanri",
    encrypted_password: "kanri",
    password: "kanri"
)
