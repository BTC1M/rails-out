require 'faker'

puts 'Seeding :'

puts 'Destroying previous seeds...'

User.destroy_all
Artist.destroy_all
Place.destroy_all
Event.destroy_all
UserParticipation.destroy_all
ArtistParticipation.destroy_all


puts 'Creating new seeds...'

User.create!(
  username: Faker::Name.first_name,
  email: 'admin@out.com',
  password: 'coucou',
  age: rand(18..50),
  photo: Faker::Avatar.image
)

100.times do
  User.create!(
    username: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    age: rand(18..50),
    photo: Faker::Avatar.image
  )

  Artist.create!(
    name: Faker::Music.unique.band,
    category: Faker::Music.genre,
    photo: Faker::Avatar.image,
    spotify_link: Faker::Internet.url(host: 'spotify.com')
  )

  Place.create!(
    name: Faker::FunnyName.name,
    details: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium tempora earum distinctio, dolorem explicabo blanditiis ipsum nam perspiciatis in modi quam deserunt eaque accusantium laborum labore provident, est odit possimus.',
    category: 'Bar',
    address: Faker::Address.full_address,
    photo: Faker::Placeholdit.image
  )
end
puts 'Users, Artists and Places created...'


100.times do
  Event.create!(
    title: Faker::Book.title,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem quae asperiores quam obcaecati facere impedit dolore, vitae molestiae veniam ipsa. Quis error debitis, vel nam sapiente odio minima ullam possimus!',
    price: rand(5..50),
    category: Faker::Music.genre,
    date: Faker::Date.between(from: Date.today, to: 17.days.from_now),
    start_time: '15:02:28',
    end_time: '15:02:28',
    photo: Faker::Avatar.image,
    user: User.find_by_id(rand(1..100)),
    place: Place.find_by_id(rand(1..100))
  )
end
puts 'Event created...'

100.times do
  ArtistParticipation.create!(
    artist: Artist.find_by_id(rand(1..100)),
    event: Event.find_by_id(rand(1..100))
  )
end
puts 'ArtistParticipation created...'

2000.times do
  UserParticipation.create!(
    user: User.find_by_id(rand(1..100)),
    event: Event.find_by_id(rand(1..100))
  )
end
puts 'UserParticipation created...'

puts 'Finished!'
