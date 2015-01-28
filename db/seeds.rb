# one User has many stories
# one Genre has many stories

# create some genres
sample_genres = %w(Childrens Crime Fantasy Horror Humor Mystery Poetry Romance Scifi Travel)

sample_genres.each do |genre|
  Genre.create(name: genre)
end

genres = Genre.all



# create some users
User.create(
  name: 'Daniella',
  email: '123@123.com',
  password: '123',
  password_confirmation: '123'
  )

4.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123',
    password_confirmation: '123'
    )
end

users = User.all



#create some stories
for i in users
  3.times do
    i.stories.create(
      title: Faker::Lorem.word,
      content: Faker::Lorem.paragraph,
      fiction: [true,false].sample,
      genre: genres.sample,
      author: users.sample
      )
  end
end
