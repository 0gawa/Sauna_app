# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

for num in 6..11 do
    SaunaInfo.create!(
        temperature: num*10,
        explain: "サウナ室は#{num*10}度です。"
    )
end

[8, 10, 12, 15, 17, 20, 25].each do |n|
    Water.create!(
        temperature: n,
        explain: "水の温度は#{n}度です。"
    )
end

10.times do |n|
    Sauna.create!(
      name: "サウナ施設 No.#{n + 1}",
      address: "東京都#{n + 1}丁目",
      sauna_info_id: 5,
      water_id: 3
    )
end