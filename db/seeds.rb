# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sian = User.create(email: 'sian.m.stone@gmail.com', password: 'foobar', username: 'siansian')


jest = Book.create(
  title: "Infinite Jest",
  first_published: 1996,
  isbn: "9-780349121086",
  pages: 1080
  )

dfw = Author.create(
  first_name: "David",
  last_name: "Foster Wallace",
  birth_year: 1962,
  nationality: "American",
  born: "California, USA",
  death_year: 2008,
  gender: 0
  )

ub = UsersBook.create(user: sian, book: jest)
ab = AuthorsBook.create(author: dfw, book: jest)
ua = UsersAuthor.create(user: sian, author: dfw)

Quote.create(user: sian, quotable: ub, quote_text: "some text")
Quote.create(user: sian, quotable: ua, quote_text: "second quote text")

Note.create(user: sian, notable: ub, note_text: "This a note on Infinite Jest")
Note.create(user: sian, notable: ua, note_text: "This a note about David Foster Wallace")


reality = Book.create(
  title: "Reality Is Not What It Seems",
  first_published: 2016,
  isbn: "9-780735213920",
  pages: 234
  )

rovelli = Author.create(
  first_name: "Carlo",
  last_name: "Rovelli",
  birth_year: 1958,
  nationality: "Italian",
  born: "Verona, Italy",
  gender: 0
  )

ab2 = AuthorsBook.create(author: rovelli, book: reality)
