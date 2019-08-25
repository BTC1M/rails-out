require 'faker'


##################################################################
# INITIALISATION
##################################################################

puts 'Destroying previous seed...'

Event.destroy_all
Place.destroy_all
UserParticipation.destroy_all
ArtistParticipation.destroy_all
Artist.destroy_all
User.destroy_all

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

music_categories = ['Electro', 'House', 'Techno', 'Funk', 'Rock', 'Hip-hop', 'Latino']
event_categories = ['Concert', 'Festival', 'Bar', 'Club', 'Open air', 'Rooftop']

unknown_artist = Artist.create!(
    name: "DJ Résident",
    category: "Electro",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  )

##################################################################
# CREATION DES EVENEMENTS
##################################################################

puts "Creating new seed..."

Event.create!(
    title: "Apéro Mojito Party Au Red Lion",
    description: "Tous les lundis, c'est MOJITO PARTY 🍹
    En partenariat avec Bacardi, viens siroter nos mojitos de 16h à 2h en HAPPY HOUR à 7€ (au lieu de 9€).
    Au programme : coucher de soleil, musique, goodies, chapeau, lunette de soleil, etc ...
    Toute la semaine, HAPPY HOUR sur une sélection de bières pression de 17h à 21h ✌✌",
    price: 0,
    category: "Bar",
    date: Date.new(2019,8,26),
    start_time: '16:00:00',
    end_time: '02:00:00',
    photo: "https://scontent-mrs2-1.xx.fbcdn.net/v/t1.0-9/66439879_1212642738907403_8080812986958086144_o.jpg?_nc_cat=101&_nc_oc=AQnbIpRwLffcZ1KwlUQAgn6zmAj8A8BAW99OcEtR4HACISFodEWgaX8G31nkTZ1yeyg&_nc_ht=scontent-mrs2-1.xx&oh=a0f6520caba5fa59bc06f6eeb879f8e2&oe=5E10D0F8",
    place: Place.create!(
      name: "Red Lion",
      details: "Un Pub irlandais, situé face aux plages de Borély à Marseille, le Red lion vous acceuille dans un cadre sympa et authentique pour déguster toutes ses bières pression, ses meilleurs whisky et pour les fans, les cocktails au « shaker » façon Viny au lounge.",
      category: "Bar",
      address: "233 pierre mendes france, 13008 Marseille",
      photo: "https://www.architecte-agencement-decoration.com/wp-content/uploads/2019/03/Pub-Anglais-Style-Victorien-The-Red-Lion-Marseille-Marseille-Edmond-Garnier-DCA-Decoration-Concept-Amenagement-2.jpg"
    )
  )

ArtistParticipation.create!(
    artist: unknown_artist,
    event: Event.find_by_title("Apéro Mojito Party Au Red Lion")
  )

# -----------------------------------------------------

Event.create!(
    title: "La Friche - ON AIR : SIDI&CO",
    description: "Welcome to #onair2019 ! 🚀
    Sidi&co investit le toit-terrasse pour ce dernier week-end d'août avec un événement original, alliant 3 artistes dont les genres, les styles musicaux et les cultures sont aux antipodes les uns des autres.
    WARUM DJ SET / HARD FIST - LYON : ORIENTAL WAVES
    DJ DZIRI DJ SET / SOUK SESSIONS - BRUXELLES : ORIENTAL TECHNO
    ROZZMA LIVE / CRAMMED DISCS - LE CAIRE : AFRICAN BASS",
    price: 0,
    category: "Rooftop",
    date: Date.new(2019,8,30),
    start_time: '19:00:00',
    end_time: '23:00:00',
    photo: "event2.jpeg",
    place: Place.create!(
      name: "La friche belle de mai",
      details: "Des soirées musicales tous les week-ends de l'été sur le toit-terrasse de la Friche, ouvertes à tous et gratuites. De nombreux artistes assurent ce voyage estival musical avec vue panoramique sur Marseille. À bord, terrain de pétanque, jeux pour enfants, bar à cocktails et délices à grignoter. Prêts pour le décollage ?",
      category: "Rooftop",
      address: "41 Rue Jobin, 13003 Marseille",
      photo: "https://pbs.twimg.com/profile_images/1103323851788873728/Rsa59Wn3_400x400.png"
    )
  )

ArtistParticipation.create!(
    artist: Artist.create!(
      name: "Warum",
      category: "Electro",
      photo: "warum.png",
      spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/450173403&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
    ),
    event: Event.find_by_title("La Friche - ON AIR : SIDI&CO")
  )

ArtistParticipation.create!(
    artist: Artist.create!(
      name: "DJ DZIRI",
      category: "Electro",
      photo: "djdziri.png",
      spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/593454987&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
    ),
    event: Event.find_by_title("La Friche - ON AIR : SIDI&CO")
  )

ArtistParticipation.create!(
    artist: Artist.create!(
      name: "Rozzma",
      category: "Electro",
      photo: "rozzma.png",
      spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/409116699&amp;color=ff5500"
    ),
    event: Event.find_by_title("La Friche - ON AIR : SIDI&CO")
  )

# -----------------------------------------------------














# -----------------------------------------------------

puts 'Finished!'

#########################################################
# ANCIENNE SEED (avec Faker)
#########################################################

# puts 'Creating artists...'

# Artist.create!(
#     name: "Petit Biscuit",
#     category: "Electro",
#     photo: Faker::Avatar.image(format: "jpg"),
#     spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/269892869&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
#   )

# 99.times do
#   Artist.create!(
#     name: Faker::Music.unique.band,
#     category: music_categories.sample,
#     photo: Faker::Avatar.image(format: "jpg"),
#     spotify_link: Faker::Internet.url(host: 'spotify.com')
#   )
# end

# --------------------------------------------------------

# puts 'Creating places and events...'

# adresses = []
# adresses << "9 Quai du Lazaret, 13002 Marseille"
# adresses << "16 Rue Charles Plumier, 13002 Marseille"
# adresses << "29 Boulevard Eugène Pierre, 13005 Marseille"
# adresses << "28 Rue du Berceau, 13005 Marseille"
# adresses << "231 Avenue Pierre Mendès France, Marseille"
# adresses << "167 Rue Paradis, 13006 Marseille"
# adresses << "30 Avenue Joseph Vidal, 13008 Marseille"
# adresses << "109 Avenue de la Jarre, 13009 Marseille"
# adresses << "41 Rue Jobin, 13003 Marseille"
# adresses << "39 rue de rome, 13006 Marseille"
# adresses << "71 rue Sainte, Marseille"
# adresses << "54 Corniche Président John Fitzgerald Kennedy, 13007 Marseille"
# adresses << "72 Quai du Port, 13002 Marseille"
# adresses << "90 Boulevard Rabatau, 13008 Marseille"
# adresses << "138 Avenue Pierre Mendès France, 13008 Marseille"
# adresses << "64 Rue de la Loubière, 13006 Marseille"
# adresses << "63 Place Jean Jaurès, 13006 Marseille"
# adresses << "603 Rue Saint-Pierre, 13012 Marseille"
# adresses << "2 Place Notre-Dame-Du-Mont 13006 Marseille"
# adresses << "17, Quai de rive neuve 13007 Marseille"
# adresses << "24 Quai de Rive Neuve, 13007 Marseille"
# adresses << "72 Quai du Port, 13002 Marseille"
# adresses << "2 Avenue Ferdinand Flotte, 13008 Marseille"
# adresses << "244 Chemin du Roucas Blanc, 13007 Marseille"
# adresses << "35 Rue Boudouresque, 13007 Marseille"
# adresses << "85 Boulevard Bompard, 13007 Marseille"
# adresses << "26 Chemin de Sainte-Marthe, 13014 Marseille"
# adresses << "1 Rue Saint-François de Sales, 13004 Marseille"
# adresses << "79 Avenue de Saint-Julien, 13012 Marseille"
# adresses << "11 Rue Glandeves, 13001 Marseille"

# adresses.each do |adresse|
#   place = Place.create!(
#     name: Faker::FunnyName.name,
#     details: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium tempora earum distinctio, dolorem explicabo blanditiis ipsum nam perspiciatis in modi quam deserunt eaque accusantium laborum labore provident, est odit possimus.',
#     category: 'Bar',
#     address: adresse,
#     #address: Faker::Address.full_address,
#     photo: Faker::Placeholdit.image
#   )

#   Event.create!(
#     title: Faker::Book.title,
#     description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem quae asperiores quam obcaecati facere impedit dolore, vitae molestiae veniam ipsa. Quis error debitis, vel nam sapiente odio minima ullam possimus!',
#     price: rand(5..50),
#     #category: Faker::Music.genre,
#     category: event_categories.sample,
#     date: Faker::Date.between(from: Date.tomorrow, to: 17.days.from_now),
#     start_time: '19:02:28',
#     end_time: '02:02:28',
#     photo: Faker::Placeholdit.image,
#     user: User.find_by_id(rand(1..100)),
#     place: place
#   )
# end

# --------------------------------------------------------

# puts 'Creating artist participations...'

# 500.times do
#   UserParticipation.create!(
#     user: User.find_by_id(rand(3..100)),
#     event: Event.find_by_id(rand(1..30))
#   )
# end

# 100.times do
#   ArtistParticipation.create!(
#     artist: Artist.find_by_id(rand(1..100)),
#     event: Event.find_by_id(rand(1..30))
#   )
# end

# puts 'Finished!'
