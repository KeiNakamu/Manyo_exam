# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{name: '小林',email: 'test2205@test.com',password: '12341234',admin: true},
              {name: '青野',email: 'test15@test.com',password: '12345123'},
              {name: '遠藤',email: 'test16@test.com',password: '12345612'},
              {name: '門脇',email: 'test04@test.com',password: '12345671'},
              {name: '金子',email: 'test05@test.com',password: '12345678'},
              {name: '齋藤',email: 'test06@test.com',password: '81234123'},
              {name: '佐藤',email: 'test07@test.com',password: '89123412'},
              {name: '鈴木',email: 'test08@test.com',password: '78912341'},
              {name: '中村',email: 'test09@test.com',password: '67891234'},
              {name: '西川',email: 'test20@test.com',password: '56789123'},
              {name: '丸岡',email: 'test11@test.com',password: '45678912'},
              {name: '森塚',email: 'test12@test.com',password: '34567891'},
              {name: '山田',email: 'test13@test.com',password: '23456789'},
              {name: '吉田',email: 'test14@test.com',password: '12345678'}])

5.times do |i|
  Label.create!(name: "sample#{i + 1}")
end