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



# Initialize Product(初始化商品)

# Product.create!(title: "青瓷碗",
#    description: "青瓷碗",
#    price: 1000,
#    quantity: 20,
#    image: open("http://img11.shop-pro.jp/PA01290/357/product/81667617_o1.jpg?20141007132916")
#    )
#
#  Product.create!(title: "青如玉",
#    description: "龙泉青瓷",
#    price: 5000,
#    quantity: 10,
#    image: open("http://www.hschinese.com/sites/default/files/attached/image/201530/20150723103343_30143.jpg")
#    )

Product.create!(title: "QC-35",
   description: "耳机",
   price: 2800,
   quantity: 5,
   image: open("https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg")
   )

 Product.create!(title: "Iphone7",
   description: "手机",
   price: 5000,
   quantity: 5,
   image: open("https://images-cn.ssl-images-amazon.com/images/I/51q3gdJGenL._SL800_.jpg")
   )

 Product.create!(title: "Cherry Keyboard",
   description: "G80-3000键盘",
   price: 2800,
   quantity: 5,
   image: open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg")
   )
