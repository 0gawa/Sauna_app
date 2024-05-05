# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

for num in 50..120 do
    SaunaInfo.create!(
        temperature: num
    )
end

for num in 1..35 do
    Water.create!(
        temperature: num,
    )
end

10.times do |n|
    Sauna.create!(
      name: "サウナ施設 No.#{n + 1}",
      address: "東京都#{n + 1}丁目",
    )
end

NumberSauna.create!(
    [
        {sauna_id: 1, sauna_info_id: 51},
        {sauna_id: 1, sauna_info_id: 49},
        {sauna_id: 2, sauna_info_id: 55},
        {sauna_id: 3, sauna_info_id: 43},
        {sauna_id: 4, sauna_info_id: 40},
        {sauna_id: 5, sauna_info_id: 50},
        {sauna_id: 5, sauna_info_id: 43},
        {sauna_id: 3, sauna_info_id: 20},
        {sauna_id: 2, sauna_info_id: 30},
    ]
)
for i in 1..5 do 
    NumberSauna.create!(
        sauna_id: i+5,
        sauna_info_id: i+65
    )
end

NumberWater.create!(
    [
        {sauna_id: 1, water_id: 2},
        {sauna_id: 1, water_id: 17},
        {sauna_id: 2, water_id: 20},
        {sauna_id: 3, water_id: 25},
        {sauna_id: 4, water_id: 15},
        {sauna_id: 5, water_id: 15},
        {sauna_id: 5, water_id: 14},
        {sauna_id: 3, water_id: 18},
        {sauna_id: 2, water_id: 30},
    ]
)
for i in 1..5 do
    NumberWater.create!(
        sauna_id: i+5,
        water_id: i+10
    )
end

Manager.create!(
    email: "kanrisya@gmail.com",
    name: "管理者龍太郎",
    encrypted_password: "111111"
)