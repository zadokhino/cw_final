# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(name: 'Admin', email: "admin@example.com", password: 'password')
category = Category.create(title: 'test')
30.times do
	Place.create(title: 'test', category_id: category.id, description: "blablabla", user_id: admin.id)
end