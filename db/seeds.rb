# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')
admin = User.create(name: 'Admin', email: "admin@example.com", password: 'password', admin: true)


category1 = Category.create(title: "Бары")
category2 = Category.create(title: "Рестораны")

15.times do 
	Place.create(title: "Ресторан", description: "Новый ресторан", agree: true, category: category2,
	 main_photo: File.new(fixtures_path.join('1.jpg')), status: true)
end
15.times do 
	Place.create(title: "Бар", description: "Новый бар", agree: true, category: category1,
	 main_photo: File.new(fixtures_path.join('2.jpg')), status: true)
end
