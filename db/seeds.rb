require 'faker'


##################################################################
# INITIALISATION
##################################################################

puts 'Destroying previous seed...'

Event.destroy_all
Place.destroy_all
UserParticipation.destroy_all
ArtistParticipation.destroy_all
UserStyle.destroy_all
Artist.destroy_all
User.destroy_all
Style.destroy_all

User.create!(
  username: 'Admin',
  email: 'admin@out.com',
  password: 'coucou',
  age: rand(18..50),
  photo: Faker::Avatar.image
)

User.create!(
  username: 'Admin2',
  email: 'admin@gmail.com',
  password: 'coucou',
  age: rand(18..50),
  photo: Faker::Avatar.image
)


music_categories = ['Electro','House','Techno','Minimal','Funk','Rock','Hip-Hop','Tech house','Drum & Bass', 'Progressive', 'Alternative', 'Autre']
event_categories = ['Concert', 'Festival', 'Bar', 'Club', 'Open air', 'Rooftop', 'Beach']

music_categories.each do |music_category|
  Style.create!(
    name: music_category
  )
end


##################################################################
# CREATION DES EVENEMENTS
##################################################################

puts "Creating new seed..."


Event.create!(
  title: "Acontraluz 2019",
  description: "Le festival ACONTRALUZ revient cette année le 6 & 7 Septembre!
  Au programme, des artistes techno et électro internationaux, des animations, des événements partenaires, un espace VIP et encore beaucoup d'autres surprises...",
  price: 36,
  category: "Festival",
  date: Date.new(2019,9,6),
  start_time: '18:00:00',
  end_time: '05:00:00',
  photo: "http://static.teckyo.com/uploads/2019/07/banni%C3%A8re_AC2019.jpg",
  buy_link: "https://www.digitick.com/d/event/acontraluz-2019-jour-1/esplanade-du-j4/6136861",
  place: Place.create!(
    name: "Esplanade du J4",
    details: "Lieu incontournable du festival de musique électronique Acontraluz 6ème édition",
    category: "Festival",
    address: "Esplanade Du J4, Marseille",
    photo: "acontraluz.png"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Solomun",
    category: "Electro",
    photo: "https://www.acontraluz.fr/wp-content/uploads/2019/06/solomun2019.jpg",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/16683323&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Acontraluz 2019")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Stephan Bodzin",
    category: "Electro",
    photo: "https://www.acontraluz.fr/wp-content/uploads/2019/05/stephanbodzin.jpg",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/235900201&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Acontraluz 2019")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Sam Paganini",
    category: "Techno",
    photo: "https://www.acontraluz.fr/wp-content/uploads/2019/07/Sam-Paganini-sq-300x300.jpg",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/603243471&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Acontraluz 2019")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Agoria",
    category: "Electro",
    photo: "https://www.acontraluz.fr/wp-content/uploads/2019/05/agoria.jpg",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/555621288&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Acontraluz 2019")
)

# -----------------------------------------------------

Event.create!(
  title: "La frenchie - Ofenbach",
  description: "Vendredi c’est La Frenchie ! Une soirée qui met à l’honneur les DJ et artistes français. De l’éclosion de la House aux prémices de la Techno en passant par la French Touch 1.0 (et 2.0) et le Disco, La Frenchie te fera voyager à travers cette formidable scène électronique nationale ! De 19h à 21h notre équipe de bartenders vous OFFRE le deuxième verre. Tickets sur place : 10€ de 19h à 20h, 15€ à partir de 20h puis 20€ à partir de 23h.",
  price: 15,
  category: "Rooftop",
  date: Date.new(2019,8,30),
  start_time: '19:00:00',
  end_time: '02:00:00',
  photo: "lafrenchie.png",
  buy_link: "https://www.digitick.com/d/event/r2-rooftop-la-frenchie-ofenbach/rooftop-r2-marseille/6471383",
  place: Place.create!(
    name: "Rooftop R2",
    details: "Le Rooftop, c’est le lieu incontournable du panorama Marseillais et l’un des toits-terrasse les plus exceptionnels d’Europe… On vient ici défier les lois de la gravité pour « s’envoyer en l’air » au son d’une programmation exceptionnelle.",
    category: "Rooftop",
    address: "9 Quai du Lazaret, 13002 Marseille",
    photo: "http://www.airdemarseille.com/wp-content/uploads/2016/07/IMG_3972-1200x800.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Ofenbach",
    category: "Electro",
    photo: "https://www.sortiraparis.com/images/55/1665/303597-ofenbach-x-zig-zag.jpg",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/603220845&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("La frenchie - Ofenbach")
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
  date: Date.new(2019,8,31),
  start_time: '19:00:00',
  end_time: '23:00:00',
  photo: "eventfriche.png",
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

Event.create!(
  title: "Syndröme des lives",
  description: "Avant la rentrée, syndröme vous offre une soirée qui sera essentiellement constituée de lives. Entrée à 3€ avant 21h.",
  price: 5,
  category: "Concert",
  date: Date.new(2019,8,30),
  start_time: '19:00:00',
  end_time: '02:00:00',
  photo: "syndrome.png",
  place: Place.create!(
    name: "Le Chapiteau - la belle de mai",
    details: "Le Chapiteau est un bar culturel, un bar concert, un espace de création et de liberté où le sound-system ne s’arrête jamais. Ce sont toutes ces choses qui font du Chapiteau un lieu de vie unique à Marseille.",
    category: "Open air",
    address: "38 Traverse Notre Dame du Bon Secours, 13003 Marseille",
    photo: "https://www.tourisme-marseille.com/wp-content/uploads/2017/08/le-chapiteau-la-belle-de-mai-bar-concerts-marseille-provence-4.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Trader",
    category: "Techno",
    photo: "trader.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/625994979&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Syndröme des lives")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Axiom",
    category: "Drum & Bass",
    photo: "axiom.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/179158679&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Syndröme des lives")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Lö Pagani",
    category: "Techno",
    photo: "lopagani.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/576844590&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Syndröme des lives")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Matthias Torm",
    category: "Techno",
    photo: "matthias-torm.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/514632324&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Syndröme des lives")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Ghost",
    category: "Techno",
    photo: "ghost.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/571513629&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Syndröme des lives")
)


# -----------------------------------------------------

Event.create!(
  title: "Le Sport Beach - FREAKY FRIDAY",
  description: "Freaky Friday vous donne RDV tous les Vendredis au Sport Beach #souslespalmiers Un concentré de gaïté, d’énergie et de fête, c’est ça Freaky Friday. THE Freaky Friday, Crazy show ! Un canard géant, des pom-pom girls, un tifo, une pêche aux canards pour gagner des consos. Freaky Friday ne se refuse rien pour vous amuser. Party is love. Music is love. Love is love.",
  price: 0,
  category: "Open air",
  date: Date.new(2019,8,30),
  start_time: '19:00:00',
  end_time: '02:00:00',
  photo: "freaky-friday.png",
  place: Place.create!(
    name: "Le Sport Beach",
    details: "Situé à l’Escale Borély, à deux pas du bord de mer et de l’hippodrome, le Sport Beach est un bar-restaurant design et contemporain aux airs de Paradis. Loin de l’agitation du centre-ville, c’est au bord de la piscine, sur la terrasse surplombée de palmiers, que l’on déguste des plats méditerranéens le midi ou le soir, mélange d’audace culinaire et des fondamentaux de la gastronomie, ou bien que l’on sirote un cocktail en fin de journée devant le coucher de soleil.",
    category: "Pool party",
    address: "138 Avenue Pierre Mendès France, Marseille 13008",
    photo: "https://media-cdn.tripadvisor.com/media/photo-s/13/5d/a5/1e/cadre-magnifique-avec.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DJ Résident",
    category: "Autre",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  ),
  event: Event.find_by_title("Le Sport Beach - FREAKY FRIDAY")
)


# -----------------------------------------------------

Event.create!(
  title: "Baou: barcelona Show with Yaya SEB Zito",
  description: "🇪🇸 Barcelona SHOW présente Yaya & Seb Zito 🇪🇸
  ▬▬▬▬▬LINE UP▬▬▬▬▬▬
  ➫ Yaya (Desolat Music Group / Get Physical Music - 🇮🇹)
  ➫ Seb Zito (FUSE - 🇬🇧)
  ➫ Lo Coco (Noexcuses / Safe – 🇫🇷)
  ▬▬▬▬BILLETTERIE▬▬▬▬
  EARLY → 8€ (Hors frais de loc)
  NORMAL → 10€ (Hors frais de loc)
  LATE → 12€ (Hors frais de loc) ",
  price: 10,
  category: "Rooftop",
  date: Date.new(2019,8,30),
  start_time: '19:00:00',
  end_time: '02:00:00',
  photo: "https://www.residentadvisor.net/images/events/flyer/2019/8/fr-0830-1305337-front.jpg",
  place: Place.create!(
    name: "BAOU",
    details: "En plein coeur du 16e arrondissement de Marseille, avec une vue panoramique sur la mer, l’Estaque et la ville, le Baou accueille la crème des DJs dans un lieu totalement insolite.",
    category: "Rooftop",
    address: "1 avenue de l'Argilité, 13016 Marseille",
    photo: "https://marseille.love-spots.com/wp-content/uploads/2019/05/Le-Baou-Marseille_Club-plein-air_Love-Spots_08.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Yaya",
    category: "Tech house",
    photo: "yaya.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/464088450&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Baou: barcelona Show with Yaya SEB Zito")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Seb Zito",
    category: "Techno",
    photo: "sebzito.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/318791023&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Baou: barcelona Show with Yaya SEB Zito")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Fab Lo Coco",
    category: "Tech house",
    photo: "fablococo.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/408950547&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Baou: barcelona Show with Yaya SEB Zito")
)

# -----------------------------------------------------

Event.create!(
  title: "Vendredi underground w/ JHSelf",
  description: "JHSelf est un DJ/producteur international passionné de son, il nous arrive tout droit de Saint Tropez, où il distille avec goût une techno énergique et mélodique qui le caractérise. Accompagné de 2 de nos résidents, c'est une expédition mouvementée que nous vous préparons...",
  price: 5,
  category: "Club",
  date: Date.new(2019,8,30),
  start_time: '23:30:00',
  end_time: '06:30:00',
  photo: "underground-jhself.png",
  place: Place.create!(
    name: "Mambo",
    details: "Le club travaille pour représenter au mieux la scène électronique locale, qui couve de nombreux talents.",
    category: "Club",
    address: "1 Boulevard Charles Livon, 13007 Marseille",
    photo: "mambo.png"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "JHSelf",
    category: "Techno",
    photo: "jhself.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/568443777&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Vendredi underground w/ JHSelf")
)


# -----------------------------------------------------

Event.create!(
  title: "La Dame Noir",
  description: "Des murs sombres, une déco aux allures seventies et un nom qui évoque le meilleur de la nuit marseillaise. La programmation musicale est assurée par la maison, avec des djs invités chaque week-end – comme Joie Iacono (Cazzo Pazzo – NYC/Berlin), Kezokichi Miyazaki (Blindetonation Records – Tokyo) ou Pete Herbet (Darkness/Paradise Row – London) & Antho Nabet (Darkness).",
  price: 0,
  category: "Club",
  date: Date.today,
  start_time: '23:00:00',
  end_time: '06:00:00',
  photo: "https://tarpin-bien.com/wp-content/uploads/2016/11/MAT_4444.jpg",
  place: Place.create!(
    name: "Trolleybus",
    details: "La dame Noir records, accueille sur son autel des artistes aux productions Noir et décidées.
7 eps déjà sortis et un calendrier chargé d’ondes disco, Voodoo & dancefloor aux tempos parfois inquiétants.",
    category: "Club",
    address: "43 Quai de Rive Neuve, 13007 Marseille",
    photo: "https://letrolley.com/wp-content/uploads/2015/07/LDNx150.png"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Did Virgo",
    category: "House",
    photo: "didvirgo.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/185342939&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("La Dame Noir")
)

# -----------------------------------------------------

Event.create!(
  title: "Different mood Family au Chapiteau",
  description: "La famille Different Mood est de retour derrière les platines du chapiteau pour une soirée acidulée.
  Dans le sac pour l'occasion beaucoup d'inspiration anglaise, des rythmes breakés, de la 303 en veux tu en voilà, de l'amour et des smileys sur les galettes pour cette soirée à la belle de Mai placée sous le signe de la rave.",
  price: 3,
  category: "Open air",
  date: Date.new(2019,8,31),
  start_time: '19:00:00',
  end_time: '04:00:00',
  photo: "different-mood.png",
  place: Place.find_by_name("Le Chapiteau - la belle de mai")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DMOOD (Algo Guerriau / Jo.Z / Suave)",
    category: "House",
    photo: "dmood.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/316366105&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("Different mood Family au Chapiteau")
)


# -----------------------------------------------------

Event.create!(
  title: "La cabane des amis x Plage du Roucas Blanc 29/08",
  description: "Les apéros du jeudi à la Paillote Borely ! 🚨 Une Paillote en bord de plage 🏝 Un beau coucher de soleil 🌅 Des mojitos succulents 🍸 Un Dj de folie 🎤🎧 Une clientèle 30-60 ans 👌❤️ Une ambiance déjantée ! 😱🎉 C’est tous les jeudis de l’été ! ",
  price: 0,
  category: "Beach",
  date: Date.new(2019,8,29),
  start_time: '18:30:00',
  end_time: '01:00:00',
  photo: "https://www.lanuitmagazine.com/lanuitmag/wp-content/uploads/2018/06/06-28-la-cabane-du-roucas-blanc-plage-du-roucas-blanc-768x432.jpg",
  place: Place.create!(
    name: "Buvette du roucas",
    details: "Une cabane bleu ciel, la mer, le soleil, la plage. Bienvenue à la Cabane des Amis, notre paradis caché.",
    category: "Beach",
    address: "67 Prom. Georges Pompidou, 13008 Marseille",
    photo: "paillote.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DJ Résident",
    category: "Autre",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  ),
  event: Event.find_by_title("La cabane des amis x Plage du Roucas Blanc 29/08")
)


# -----------------------------------------------------

Event.create!(
  title: "La cabane des amis x Plage du Roucas Blanc 05/09",
  description: "Les apéros du jeudi à la Paillote Borely ! 🚨 Une Paillote en bord de plage 🏝 Un beau coucher de soleil 🌅 Des mojitos succulents 🍸 Un Dj de folie 🎤🎧 Une clientèle 30-60 ans 👌❤️ Une ambiance déjantée ! 😱🎉 C’est tous les jeudis de l’été ! ",
  price: 0,
  category: "Beach",
  date: Date.new(2019,9,05),
  start_time: '18:30:00',
  end_time: '01:00:00',
  photo: "https://www.lanuitmagazine.com/lanuitmag/wp-content/uploads/2018/06/06-28-la-cabane-du-roucas-blanc-plage-du-roucas-blanc-768x432.jpg",
  place: Place.find_by_name("Buvette du roucas")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DJ Résident",
    category: "Autre",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  ),
  event: Event.find_by_title("La cabane des amis x Plage du Roucas Blanc 05/09")
)

# -----------------------------------------------------

Event.create!(
  title: "Apéro Mojito Party Au Red Lion",
  description: "Tous les lundis, c'est MOJITO PARTY 🍹
  En partenariat avec Bacardi, viens siroter nos mojitos de 16h à 2h en HAPPY HOUR à 7€ (au lieu de 9€).
  Au programme : coucher de soleil, musique, goodies, chapeau, lunette de soleil, etc ...
  Toute la semaine, HAPPY HOUR sur une sélection de bières pression de 17h à 21h ✌✌",
  price: 0,
  category: "Bar",
  date: Date.new(2019,8,26),
  #date: Date.today,
  start_time: '16:00:00',
  end_time: '02:00:00',
  photo: "https://scontent-mrs2-1.xx.fbcdn.net/v/t1.0-9/66439879_1212642738907403_8080812986958086144_o.jpg?_nc_cat=101&_nc_oc=AQnbIpRwLffcZ1KwlUQAgn6zmAj8A8BAW99OcEtR4HACISFodEWgaX8G31nkTZ1yeyg&_nc_ht=scontent-mrs2-1.xx&oh=a0f6520caba5fa59bc06f6eeb879f8e2&oe=5E10D0F8",
  place: Place.create!(
    name: "Red Lion",
    details: "Un Pub irlandais, situé face aux plages de Borély à Marseille, le Red lion vous acceuille dans un cadre sympa et authentique pour déguster toutes ses bières pression, ses meilleurs whisky et pour les fans, les cocktails au « shaker » façon Viny au lounge.",
    category: "Bar",
    address: "231 Avenue Pierre Mendès France, 13008 Marseille",
    photo: "https://www.architecte-agencement-decoration.com/wp-content/uploads/2019/03/Pub-Anglais-Style-Victorien-The-Red-Lion-Marseille-Marseille-Edmond-Garnier-DCA-Decoration-Concept-Amenagement-2.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DJ Résident",
    category: "Electro",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  ),
  event: Event.find_by_title("Apéro Mojito Party Au Red Lion")
)

# -----------------------------------------------------

Event.create!(
  title: "Les apéros des halles",
  description: "Les Halles vous donne RDV à partir du 31 Mai pour des APÉROS TAPAS tous les vendredis et samedis de l’été ✨
  👉 Venez vous détendre face à la mer dans une ambiance conviviale sur la terrasse des Halles en dégustant les meilleurs TAPAS et PIZZAS de la région. 💓
  🍴 FOOD * PRODUITS DE QUALITÉ GARANTIS * ➹ Provenance direct de nos étales gourmandes des Halles 😋 ➹ Dessert Maison de notre talentueuse Pâtissière 🍰 .
  ➹ Large sélection de vins & spiritueux chez le CAVISTE 🥂 ➹ Cocktails de fruits frais avec et sans alcool au menu 🍹 ⭐ Au programme ⭐
  ➹ Coucher de soleil garanti 🌞 ➹ Bon son assuré 🎸 ➹ Ambiance CHILL à souhait 😎 ➹ Rosé bien frais tout l’été ❄ ",
  price: 0,
  category: "Bar",
  date: Date.new(2019,8,31),
  start_time: '18:00:00',
  end_time: '00:00:00',
  photo: "halles.png",
  place: Place.create!(
    name: "Halles de la Major",
    details: "Au pied de la Cathédrale de la Major, sous ses voûtes, Les Halles de la Major s’inscrivent dans un quartier en pleine extension. Situé entre le quartier du Panier et celui de la Joliette, venez découvrir ce lieu exceptionnel après une balade. Situé face à la mer, venez apprécier le cadre et la vue magnifique qui s’offre à vous aux Halles de la Major.",
    category: "Bar",
    address: "12 Quai de la Tourette, 13002 Marseille",
    photo: "http://www.marseille-congres.com/sites/default/files/styles/partenaire_full_images/public/part_images/halles-major1.jpg?itok=4YLKNyhW"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DJ Résident",
    category: "Autre",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  ),
  event: Event.find_by_title("Les apéros des halles")
)


# -----------------------------------------------------

Event.create!(
  title: "PNRM x Wattsmyname - White party",
  description: "PNRM - Samedi 31 Août au Baou Marseille
  ⚪️Summer White party⚪️
  SUMMER WHITE PARTY, la soirée tout en blanc
  by Wattsmyname x PNRM 'All white everything'
  •Tarif sur place 20€
  •ou 10€ si vous êtes vêtu de blanc (Haut blanc minimum)
  Entrée gratuite 19H-20H30",
  price: 20,
  category: "Open air",
  date: Date.new(2019,8,31),
  start_time: '19:00:00',
  end_time: '02:00:00',
  photo: "pnrm.png",
  place: Place.find_by_name("BAOU")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Livoo",
    category: "Hip-Hop",
    photo: "livoo.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/593665629&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("PNRM x Wattsmyname - White party")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Mr. Faze",
    category: "Hip-Hop",
    photo: "faze.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/567330675&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("PNRM x Wattsmyname - White party")
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Habba Babba",
    category: "Autre",
    photo: "habba.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/601338537&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("PNRM x Wattsmyname - White party")
)


# -----------------------------------------------------

Event.create!(
  title: "Opening ceremony",
  description: "🎫 Entrée: FREE AVANT 1h00📍📍
10€ avec conso après 1h00
🍔 Snacking, Burgers maison...
🍹 Cocktails
🅿 Grand parking facile d'accès et Sécurisé.
🕶 Réservez votre Table et espace ombragé : 06 82 84 41 54",
  price: 0,
  category: "Club",
  date: Date.new(2019,8,31),
  start_time: '23:30:00',
  end_time: '06:00:00',
  photo: "openingspartacus.png",
  place: Place.create!(
    name: "Spartacus",
    details: "L'histoire d'amour entre le SPARTACUS Club et la musique électronique n'est pas toute jeune, cette année, nous avons célébré ces seize années de partage, de fête, de joie et d'amour.
Cette histoire perdure depuis tant d'années, grâce aux nombreux artistes de qualité qui se sont succédés les uns après les autres.",
    category: "Club",
    address: "7 Boulevard Lacordaire, 13013 Marseille",
    photo: "spartacus.png"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "DJ Résident",
    category: "Autre",
    photo: "http://stemfellowship.org/wp-content/uploads/2019/05/unknown-person-1-1.jpg",
    spotify_link: nil
  ),
  event: Event.find_by_title("Opening ceremony")
)


# -----------------------------------------------------

Event.create!(
  title: "DJ SET & LIVE",
  description: "LITTLE BOB (DJ SET)
Quand un morceau de musique donne envie de danser on dit qu’il groove ! Quand on dit qu’un DJ groove cela veut dire qu’il apporte de l’énergie et du fun sur les morceaux. Passionné depuis toujours de sons qui groovent, la musique, il l’aime et il aime aussi et surtout en faire profiter les autres !!!",
  price: 0,
  category: "Bar",
  date: Date.new(2019,8,31),
  start_time: '21:30:00',
  end_time: '00:30:00',
  photo: "mamashelter.png",
  place: Place.create!(
    name: "Mama Shelter",
    details: "Mama Shelter propose des chambres design avec wifi et films gratuits, ainsi qu'un restaurant, un bar et un patio insolite à Marseille.",
    category: "Bar",
    address: "64 Rue de la Loubière, 13006 Marseille",
    photo: "https://www.mamashelter.com/files/live/sites/mamashelter/files/HP%20Marseille/Restaurants/Restaurant/MamaShelter_Marseille_08_18_%2089_FA2.jpg"
  )
)

ArtistParticipation.create!(
  artist: Artist.create!(
    name: "Little Bob",
    category: "Hip-Hop",
    photo: "littlebob.png",
    spotify_link: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/287499736&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
  ),
  event: Event.find_by_title("DJ SET & LIVE")
)


# -----------------------------------------------------


#UserParticipation.create!(
#  user: User.find_by_username('Admin'),
#  event: Event.find_by_title('La Friche - ON AIR : SIDI&CO')
#)

puts 'Finished!'

#########################################################
# SOME FAKE EVENTS (with Faker)
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
