require 'faker'

puts 'Seeding :'

puts 'Destroying previous seeds...'

Event.destroy_all
Place.destroy_all
UserParticipation.destroy_all
ArtistParticipation.destroy_all
Artist.destroy_all
User.destroy_all


puts 'Creating new seeds...'

adresses = []
adresses << "9 Quai du Lazaret, 13002 Marseille"
adresses << "16 Rue Charles Plumier, 13002 Marseille"
adresses << "29 Boulevard Eugène Pierre, 13005 Marseille"
adresses << "28 Rue du Berceau, 13005 Marseille"
adresses << "231 Avenue Pierre Mendès France, Marseille"
adresses << "167 Rue Paradis, 13006 Marseille"
adresses << "30 Avenue Joseph Vidal, 13008 Marseille"
adresses << "109 Avenue de la Jarre, 13009 Marseille"
adresses << "41 Rue Jobin, 13003 Marseille"
adresses << "39 rue de rome, 13006 Marseille"
adresses << "71 rue Sainte, Marseille"
adresses << "54 Corniche Président John Fitzgerald Kennedy, 13007 Marseille"
adresses << "72 Quai du Port, 13002 Marseille"
adresses << "90 Boulevard Rabatau, 13008 Marseille"
adresses << "138 Avenue Pierre Mendès France, 13008 Marseille"
adresses << "64 Rue de la Loubière, 13006 Marseille"
adresses << "63 Place Jean Jaurès, 13006 Marseille"
adresses << "603 Rue Saint-Pierre, 13012 Marseille"
adresses << "2 Place Notre-Dame-Du-Mont 13006 Marseille"
adresses << "17, Quai de rive neuve 13007 Marseille"
adresses << "24 Quai de Rive Neuve, 13007 Marseille"
adresses << "72 Quai du Port, 13002 Marseille"
adresses << "2 Avenue Ferdinand Flotte, 13008 Marseille"
adresses << "244 Chemin du Roucas Blanc, 13007 Marseille"
adresses << "35 Rue Boudouresque, 13007 Marseille"
adresses << "85 Boulevard Bompard, 13007 Marseille"
adresses << "26 Chemin de Sainte-Marthe, 13014 Marseille"
adresses << "1 Rue Saint-François de Sales, 13004 Marseille"
adresses << "79 Avenue de Saint-Julien, 13012 Marseille"
adresses << "11 Rue Glandeves, 13001 Marseille"

music_categories = ['Electro', 'House', 'Techno', 'Funk', 'Rock', 'Hip-hop', 'Latino']
event_categories = ['Concert', 'Festival', 'Bar', 'Club', 'Open air', 'Rooftop']

User.create!(
  username: Faker::Name.first_name,
  email: 'admin@out.com',
  password: 'coucou',
  age: rand(18..50),
  photo: Faker::Avatar.image
)

User.create!(
  username: Faker::Name.first_name,
  email: 'admin@gmail.com',
  password: 'coucou',
  age: rand(18..50),
  photo: Faker::Avatar.image
)

98.times do
  User.create!(
    username: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    age: rand(18..50),
    photo: Faker::Avatar.image
  )
end

100.times do
  Artist.create!(
    name: Faker::Music.unique.band,
    category: music_categories.sample,
    photo: Faker::Avatar.image,
    spotify_link: Faker::Internet.url(host: 'spotify.com')
  )
end

puts 'Users and Artists created...'

adresses.each do |adresse|
  place = Place.create!(
    name: Faker::FunnyName.name,
    details: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium tempora earum distinctio, dolorem explicabo blanditiis ipsum nam perspiciatis in modi quam deserunt eaque accusantium laborum labore provident, est odit possimus.',
    category: 'Bar',
    address: adresse,
    #address: Faker::Address.full_address,
    photo: Faker::Placeholdit.image
  )

  Event.create!(
    title: Faker::Book.title,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem quae asperiores quam obcaecati facere impedit dolore, vitae molestiae veniam ipsa. Quis error debitis, vel nam sapiente odio minima ullam possimus!',
    price: rand(5..50),
    #category: Faker::Music.genre,
    category: event_categories.sample,
    date: Faker::Date.between(from: Date.today, to: 17.days.from_now),
    start_time: '15:02:28',
    end_time: '15:02:28',
    photo: Faker::Avatar.image,
    user: User.find_by_id(rand(1..100)),
    place: place
  )
end

puts 'Places and Event created...'

100.times do
  ArtistParticipation.create!(
    artist: Artist.find_by_id(rand(1..100)),
    event: Event.find_by_id(rand(1..30))
  )
end
puts 'ArtistParticipation created...'

500.times do
  UserParticipation.create!(
    user: User.find_by_id(rand(1..100)),
    event: Event.find_by_id(rand(1..30))
  )
end
puts 'UserParticipation created...'

puts 'Finished!'
