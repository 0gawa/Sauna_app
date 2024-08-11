# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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


Manager.create!(
    email: "kanrisya@gmail.com",
    name: "管理者龍太郎",
    encrypted_password: "111111",
    password: "111111"
)