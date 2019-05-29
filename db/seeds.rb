# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Photo.destroy_all
Route.destroy_all
Site.destroy_all
City.destroy_all
StateProvince.destroy_all
User.destroy_all
puts "creating users..."

User.create!(username: "Romain", email: "romain@email.com", password: "123456", location: "Las Vegas, Nevada", bio: "I'm a friendly climber that likes to chill by the routes and belay overall", favorite_styles: "short, pumpy", current_level: "5.7+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/romain-penaruiz_t3rddx.jpg")
User.create!(username: "Simon", email: "simon@email.com", password: "123456", route_setter: true, location: "Paris, France", bio: "I love to climb in North America! Originally from Paris, I still have some jet lag but always ready for a good outdoors climb!", favorite_styles: "sloppy", current_level: "5.8+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/SimonDHarcourt_evx38c.jpg")
User.create!(username: "Javier",email: "javier@email.com", password: "123456", route_setter: true, location: "Montreal, Quebec", bio: "Been climbing for a couple of years, I'm always up for climbing trips with friends!", favorite_styles: "bouldery, ice", current_level: "5.11c", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/javier-vaquero_lqx9uc.jpg")
User.create!(username: "Diego", email: "diego@email.com", password: "123456", route_setter: true,location: "Guadalajara, Mexico", bio: "Climbing trees since I was a child, now ready to get into more challenging routes!", favorite_styles: "crimpy, overhang", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/diego-ulibarri_qepsrc.jpg")
User.create!(username: "Robert", email: "robert@email.com", password: "123456", route_setter: true, location: "Sydney, Australia", bio: "Former skater, I transitioned into climbing recently but getting good pretty fast!", favorite_styles: "crimpy, sloppy", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/robert-simon_jx82ah.jpg")
User.create!(username: "Thomas", email: "thomas@email.com", password: "123456", location: "Victoria, BC", bio: "I'm a nature lover and a strong climber", favorite_styles: "bouldery, pumpy", current_level: "5.10a", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/thomas-ferris_isbbgs.jpg")
User.create!(username: "Michael", email: "michael@email.com", password: "123456", location: "Montreal, QC", bio: "I've been bouldering indoors for a while, and want to test my skills outdoors now", favorite_styles: "bouldery, pumpy", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/michael-zhu_oknie4.jpg")
User.create!(username: "Philippe", email: "philippe@email.com", password: "123456", location: "Laval, QC", bio: "Recent climber with a lot of potential... they say ;)", favorite_styles: "pumpy, top rope", current_level: "5.10b", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/philippe-desjardins_ghprav.jpg")
User.create!(username: "Sebastian", email: "sebastian@email.com", password: "123456", location: "Wroclaw, Poland", bio: "Been climbing in the East makes you stronger", favorite_styles: "pumpy, ice climbing", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/sebastian-czech_ct53w7.jpg")
User.create!(username: "Nicolas", email: "nicolas@email.com", password: "123456", location: "Kamouraska, QC", bio: "Love to climb outdoors, I'm a decent lead climber now", favorite_styles: "lead, crimpy", current_level: "5.11b", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144154/Students%20photos/nicolas-dontigny_jbxch7.jpg")
User.create!(username: "Jose", email: "jose@email.com", password: "123456", location: "Bogota, Colombia", bio: "When you will start climbing you will understand why I did", favorite_styles: "sloppy, overhang", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144154/Students%20photos/jose-zea_hwu6nj.jpg")
User.create!(username: "Marc", email: "marc@email.com", password: "123456", location: "Lyon, France", bio: "I was a restaurant aficionado in France, but now climbing is my diet", favorite_styles: "crimpy, belaying", current_level: "5.8+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144154/Students%20photos/ma-tallec_dqdwkq.jpg")
User.create!(username: "Joe", email: "joe@email.com", password: "123456", location: "Calabria, Italy", bio: "I love to climb after a good expresso and some pepperoni pizza", favorite_styles: "belaying, top roipe", current_level: "5.8", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144154/Students%20photos/jo-delillo_uhfxoy.jpg")
User.create!(username: "Joelle", email: "joelle@email.com", password: "123456", location: "Corsica, France", bio: "I climb mostly with my kid. He's just soo good you should see him!", favorite_styles: "short, pumpy", current_level: "5.7+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144154/Students%20photos/joelle-colomas_xuj3l2.jpg")
User.create!(username: "Gustaf", email: "gustaf@email.com", password: "123456", location: "Oslo, Sweden", bio: "I've been ice climbing for a while, and that's why I like climbing in Canada", favorite_styles: "ice, multi-pitch", current_level: "5.10b", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/gustaf-folkmar_byqbps.jpg")
User.create!(username: "Jackie", email: "jackie@email.com", password: "123456", location: "Toronto, Ontario", bio: "When I was a child, I used to watch movies about climbing ninjas, and I could not stop myself!", favorite_styles: "crimpy, technical", current_level: "5.13a", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/jackie-chao_ev7vxi.jpg")
User.create!(username: "Erik", email: "erik@email.com", password: "123456", location: "New York City, NY", bio: "I started doing parkour in the city, then moved to Vermont and love the outdoors climbs up there", favorite_styles: "soloeing, overhang", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/erik-pendleton_jhvnfy.jpg")
User.create!(username: "Heather", email: "heather@email.com", password: "123456", location: "Stoke, Vermont", bio: "I grew up climbing in the Green State, so I got quite good at that!", favorite_styles: "technical, crimpy", current_level: "5.10b", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/heather-demanbey_mjyjpa.jpg")
User.create!(username: "Claire", email: "claire@email.com", password: "123456", location: "Edmonton, Alberta", bio: "Grew up climbing in Sqamish, not ready to hit sime East Coast routes", favorite_styles: "trad, multi-pitch", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/claire-deacon_qh9nr2.jpg")
User.create!(username: "Axelle", email: "axelle@email.com", password: "123456", location: "Belleville, France", bio: "France is known for climbing, now I'm ready to show off my dynos here", favorite_styles: "buoldery, pumpy", current_level: "5.8+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144152/Students%20photos/axelle-zeller_xel04i.jpg")
User.create!(username: "Benjamin", email: "benjamin@email.com", password: "123456", location: "Belo-Horizonte, Brazil", bio: "Been in Montreal for some years, now. Whenever I have a moment, I love to go on a weekend climbing trip", favorite_styles: "crimpy, overhang", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144152/Students%20photos/benjamin-domingue_w5fgne.jpg")
User.create!(username: "Kristyna", email: "kristyna@email.com", password: "123456", location: "Prague, Czech Republic", bio: "When you grow in Prague, you know how to climb. Come over and you'll find why.", favorite_styles: "technical, top rope", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144152/Students%20photos/_Kristyna-Dierstein_o8iby1.jpg")
User.create!(username: "Fito", email: "fito@email.com", password: "123456", location: "Port-au-prince, Haiti", bio: "I'm a longtime climber that learnt old-school. Now I'm ready for new challenges", favorite_styles: "crimpy, sloppy", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144152/Students%20photos/fito-brandt_vcyf3a.jpg")
User.create!(username: "Guillaume", email: "guillaume@email.com", password: "123456", location: "Montreal, QC", bio: "I've been a runner for a long time but when I first tried to climb a wall I persisted going there day and night until I sent it", favorite_styles: "crimpy, bouldery", current_level: "5.8+", avatar_photo: "")
User.create!(username: "Alex", email: "alex@email.com", password: "123456", location: "Greenfield Park, QC", bio: "My parents didn't want me to climb the house up to the rooftop, and that's why I started!", favorite_styles: "bouldery, short", current_level: "5.10a", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144152/Students%20photos/alex-tang_kdcenl.jpg")
User.create!(username: "Aaron", email: "aaron@email.com", password: "123456", location: "Montreal, QC", bio: "I was a meme guy but then I found climbing and loved so much that I only do climbing memes", favorite_styles: "chill, belaying", current_level: "5.7+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144152/Students%20photos/aaron-feldman_k0pywe.jpg")
User.create!(username: "Stephane", email: "stephane@email.com", password: "123456", route_setter: true, location: "Laval, QC", bio: "I love to climb outdoors but I mostly enjoy setting routes so others can enjoy!", favorite_styles: "crimpy, bouldery", current_level: "5.12a", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559148091/Students%20photos/stephane_g3asa7.jpg")

puts "creating sites, cities and states/priovinces..."

state_province = StateProvince.create!(name: "Quebec")
city = City.create!(name: "Montreal", state_province: state_province)
Site.create!(name: "Mont-Trenchant", city: city)

state_province = StateProvince.create!(name: "New Hampshire")
city = City.create!(name: "Dorchester", state_province: state_province)
Site.create!(name: "Rumney", city: city)

state_province = StateProvince.create!(name: "Nuevo Leon")
city = City.create!(name: "Hidalgo", state_province: state_province)
Site.create!(name: "Potrero Chico", city: city)



puts "creating routes for Rumney..."

response = RestClient.get "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=43.8053486&lon=-71.8125811&maxDistance=200&minDiff=5.6&maxDiff=5.14&maxResults=25&key=200477633-18e31fe418ce3dd71aa4b54df54fa7e0"
routes = JSON.parse(response)

routes["routes"].each do |route|
 # binding.pry
  state = StateProvince.find_by(name: route["location"][0])
  	if state.nil?
  		state = StateProvince.create!(name: route["location"][0])
  	end

  city = City.find_by(name: route["location"][1])
  	if city.nil?
  		city = City.create!(name: route["location"][1], state_province: state)
  	end

  site = Site.find_by(name: route["location"][2])
    if site.nil?
    	site = Site.create!(name: route["location"][2], city: city)
    end

  new_route = Route.create!(user: User.all.sample, name: route["name"], site: site, type_of: route["type"], level: route["rating"], rating: route["stars"].to_i, longitude: route["longitude"].to_f, latitude: route["latitude"].to_f)
  Photo.create!(imageable: new_route, photo: route["imgMedium"])

  new_route.save!
end

sleep 3


puts "creating routes for Montreal..."

response = RestClient.get "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=45.50884&lon=-73.58781&maxDistance=200&minDiff=5.6&maxDiff=5.14&maxResults=250&key=200477633-18e31fe418ce3dd71aa4b54df54fa7e0"
routes = JSON.parse(response)

routes["routes"].each do |route|
 # binding.pry
  state = StateProvince.find_by(name: route["location"][0])
    if state.nil?
      state = StateProvince.create!(name: route["location"][0])
    end

  city = City.find_by(name: route["location"][1])
    if city.nil?
      city = City.create!(name: route["location"][1], state_province: state)
    end

  site = Site.find_by(name: route["location"][2])
    if site.nil?
      site = Site.create!(name: route["location"][2], city: city)
    end

  new_route = Route.create!(user: User.all.sample, name: route["name"], site: site, type_of: route["type"], level: route["rating"], rating: route["stars"].to_i, longitude: route["longitude"].to_f, latitude: route["latitude"].to_f)
  Photo.create!(imageable: new_route, photo: route["imgMedium"])

  new_route.save!
end

sleep 3


puts "creating routes for Potrero Chico..."

response = RestClient.get "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=25.949&lon=-100.477&maxDistance=200&minDiff=5.6&maxDiff=5.14&maxResults=250&key=200477633-18e31fe418ce3dd71aa4b54df54fa7e0"
routes = JSON.parse(response)

routes["routes"].each do |route|
 # binding.pry
  state = StateProvince.find_by(name: route["location"][0])
    if state.nil?
      state = StateProvince.create!(name: route["location"][0])
    end

  city = City.find_by(name: route["location"][1])
    if city.nil?
      city = City.create!(name: route["location"][1], state_province: state)
    end

  site = Site.find_by(name: route["location"][2])
    if site.nil?
      site = Site.create!(name: route["location"][2], city: city)
    end

  new_route = Route.create!(user: User.all.sample, name: route["name"], site: site, type_of: route["type"], level: route["rating"], rating: route["stars"].to_i, longitude: route["longitude"].to_f, latitude: route["latitude"].to_f)
  Photo.create!(imageable: new_route, photo: route["imgMedium"])

  new_route.save!
end



 puts "seeds done!"