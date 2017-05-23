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

# 执行seed后记得要去添加分类哦，不然有时会报错
Product.create!(
   id: 1,
   title: "斗笠杯",
   description: "斗笠杯",
   category_id: 1,
   price: 300,
   quantity: 10,
   image: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffv51vo3wkj30m80m8gyw.jpg")
)
Photo.create!(product_id:1,avatar: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffv51vo3wkj30m80m8gyw.jpg"))


Product.create!(
    id: 2,
    title: "青瓷斗笠杯",
    category_id: 1,
    description: "斗笠杯",
    price: 350,
    quantity: 10,
    image: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv56pzs1rj30m80m8tfo.jpg")
)
Photo.create!(product_id:2,avatar: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv56pzs1rj30m80m8tfo.jpg"))

Product.create!(
    id: 3,
    title: "功夫茶具",
    category_id: 1,
    description: "功夫茶具，配件",
    price: 150,
    quantity: 20,
    image: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv594l0b4j30m80m8139.jpg")
)
Photo.create!(product_id:3,avatar: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv594l0b4j30m80m8139.jpg"))

Product.create!(
    id: 4,
    title: "花瓣杯",
    category_id: 1,
    description: "花瓣杯",
    price: 200,
    quantity: 10,
    image: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv5ws3edsj30m80m8gol.jpg")
)
Photo.create!(product_id:4,avatar: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv5ws3edsj30m80m8gol.jpg"))


Product.create!(
    id: 5,
    title: "口福杯",
    category_id: 1,
    description: "口福杯",
    price: 100,
    quantity: 50,
    image: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv5yaawflj30m80m84ax.jpg")
)
Photo.create!(product_id:5,avatar: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv5yaawflj30m80m84ax.jpg"))

Product.create!(
    id: 6,
    title: "斗笠杯-汤水",
    category_id: 1,
    description: "斗笠杯-汤水",
    price: 400,
    quantity: 10,
    image: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv60wew78j30m80m8ar8.jpg")
)
Photo.create!(product_id:6,avatar: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv60wew78j30m80m8ar8.jpg"))


Product.create!(
    id: 7,
    title: "汝壶",
    category_id: 1,
    description: "汝瓷开片石瓢壶冰裂功夫茶具",
    price: 600,
    quantity: 30,
    image: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv62ec6cvj30m80m8k07.jpg")
)
Photo.create!(product_id:7,avatar: open("https://ws2.sinaimg.cn/large/006tNc79gy1ffv62ec6cvj30m80m8k07.jpg"))


Product.create!(
    id: 8,
    title: "青瓷葫芦",
    category_id: 1,
    description: "青瓷葫芦",
    price: 800,
    quantity: 5,
    image: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffv646jib1j30m80m87cy.jpg")
)
Photo.create!(product_id:8,avatar: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffv646jib1j30m80m87cy.jpg"))


Product.create!(
    id: 9,
    title: "七泉瓶",
    category_id: 1,
    description: "七泉瓶",
    price: 600,
    quantity: 30,
    image: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffv66gsz72j30m80m8qb9.jpg")
)
Photo.create!(product_id:9,avatar: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffv66gsz72j30m80m8qb9.jpg"))



Product.create!(
    id: 10,
    title: "影青瓷",
    category_id: 1,
    description: "影青瓷三才盖碗",
    price: 800,
    quantity: 20,
    image: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv69rznwdj30m80m8qaf.jpg")
)
Photo.create!(product_id:10,avatar: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv69rznwdj30m80m8qaf.jpg"))





Product.create!(
    id: 12,
    title: "茶台",
    category_id: 1,
    description: "茶台",
    price: 50,
    quantity: 20,
    image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffvivsrhmzj30m80m8jzf.jpg")
)
Photo.create!(product_id:12,avatar: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffvivsrhmzj30m80m8jzf.jpg"))


Product.create!(
    id: 13,
    title: "茶盘",
    category_id: 1,
    description: "重竹制茶盘",
    price: 50,
    quantity: 20,
    image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffvixhuwptj30m80m8wkh.jpg")
)
Photo.create!(product_id:13,avatar: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffvixhuwptj30m80m8wkh.jpg"))




Product.create!(
    id: 14,
    title: "武夷肉桂",
    category_id: 2,
    description: "武夷肉桂",
    price: 100,
    quantity: 20,
    image: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv6eh74lxj30ly0qoq7e.jpg")
)
Photo.create!(product_id:14,avatar: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv6eh74lxj30ly0qoq7e.jpg"))


Product.create!(
    id: 15,
    title: "日月潭红茶",
    category_id: 2,
    description: "日月潭红茶",
    price: 150,
    quantity: 20,
    image: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv6g5516ej30ly0qo0vv.jpg")
)
Photo.create!(product_id:15,avatar: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv6g5516ej30ly0qo0vv.jpg"))


Product.create!(
    id: 16,
    title: "白牡丹",
    category_id: 2,
    description: "白牡丹",
    price: 50,
    quantity: 20,
    image: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv6e3jrjgj30ly0qogqd.jpg")
)
Photo.create!(product_id:16,avatar: open("https://ws1.sinaimg.cn/large/006tNc79gy1ffv6e3jrjgj30ly0qogqd.jpg"))
