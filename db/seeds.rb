# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Initialize Admin（初始化管理员）
u = User.new
u.email = "1243281264@qq.com"           # 可以改成自己的 email

u.password = "11111111"                # 最少要八码

u.password_confirmation = "11111111"   # 最少要八码

u.is_admin = true
u.save


u = User.new
u.email = "1092167387@qq.com"           # 可以改成自己的 email

u.password = "11111111"                # 最少要八码

u.password_confirmation = "11111111"   # 最少要八码

u.is_admin = true
u.save

if User.find_by(email: "admin@test.com").nil?
  u = User.new
  u.email = "admin@test.com"
  u.password = "12345678"
  u.password_confirmation = "12345678"
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了， 账号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


Product.create!(
   id: 1,
   title: "斗笠杯",
   description: "斗笠杯",
   price: 300,
   quantity: 10
)
Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/1-1.jpg")))

Product.create!(title: "青瓷斗笠杯",
    description: "斗笠杯",
    price: 350,
    quantity: 10
)

Product.create!(title: "功夫茶具",
    description: "功夫茶具，配件",
    price: 150,
    quantity: 20
)

Product.create!(title: "花瓣杯",
    description: "花瓣杯",
    price: 200,
    quantity: 10
)

Product.create!(title: "口福",
    description: "口福杯",
    price: 100,
    quantity: 50
)

Product.create!(title: "斗笠杯-汤水",
    description: "斗笠杯-汤水",
    price: 400,
    quantity: 10

)

Product.create!(title: "汝壶",
    description: "汝瓷开片石瓢壶冰裂功夫茶具",
    price: 600,
    quantity: 30

)

Product.create!(title: "青瓷葫芦",
    description: "青瓷葫芦",
    price: 800,
    quantity: 5

)

Product.create!(title: "汝壶",
    description: "汝瓷开片石瓢壶冰裂功夫茶具",
    price: 600,
    quantity: 30

)

Product.create!(title: "汝窑系列",
    description: "汝窑系列，手工打磨更精细",
    price: 800,
    quantity: 20

)

Product.create!(title: "白牡丹",
    description: "白牡丹",
    price: 50,
    quantity: 20

)

Product.create!(title: "武夷肉桂",
    description: "武夷肉桂",
    price: 100,
    quantity: 20

)

Product.create!(title: "日月潭红茶",
    description: "日月潭红茶",
    price: 150,
    quantity: 20

)
