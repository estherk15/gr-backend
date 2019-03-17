# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
# u = User.create(name: ENV['USER'])
u = User.create(username: "Esther", password: '123')
# b = Book.find

List.destroy_all
List.create(user_id: u.id, title: "Want to Read", description: "Reading Wishlist")
List.create(user_id: u.id, title: "Currently Reading", description: "Books I am currently reading")

Book.destroy_all
20.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, cover_url: Faker::Internet.url)
end

BookList.destroy_all
5.times do
  BookList.create(list_id: List.all.sample.id, book_id: Book.all.sample.id)
end

Response.destroy_all
20.times do
  Response.create(book_id: Book.all.sample.id, user_id: u.id, title: Faker::Lorem.sentence(5), content: Faker::Lorem.sentence(10))
end
