# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




puts "Cleaning all the database.."

RouteTrip.destroy_all
puts "cleaning trips.."
Trip.destroy_all
puts "cleaning photos.."
Photo.destroy_all
puts "cleaning routes.."
Route.destroy_all
puts "cleaning sites.."
Site.destroy_all
puts "cleaning cities.."
City.destroy_all
puts "cleaning states.."
StateProvince.destroy_all
puts "cleaning users.."
User.destroy_all



default = true

if ENV["RAILS_ENV"].nil?
  puts "seed by default ? [Y/n]"
  answer = STDIN.gets.chomp
  default = (answer.downcase == 'y') ? true : false
end


number_users = 27

if default == false
  puts "lots of users ? [Y/n]"
  answer = STDIN.gets.chomp
  lots_users = (answer.downcase == "y") ? true : false
  number_users = lots_users ? 27 : 5
end


puts "creating #{number_users} users..."


User.create!(username: "Romain", email: "romain@email.com", password: "123456", location: "Las Vegas, Nevada", bio: "I'm a friendly climber that likes to chill by the routes and belay overall", favorite_styles: "short, pumpy", current_level: "5.7+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/romain-penaruiz_t3rddx.jpg")
User.create!(username: "Simon", email: "simon@email.com", password: "123456", route_setter: true, location: "Paris, France", bio: "I love to climb in North America! Originally from Paris, I still have some jet lag but always ready for a good outdoors climb!", favorite_styles: "sloppy", current_level: "5.8+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/SimonDHarcourt_evx38c.jpg")
User.create!(username: "Javier",email: "javier@email.com", password: "123456", route_setter: true, location: "Montreal, Quebec", bio: "Been climbing for a couple of years, I'm always up for climbing trips with friends!", favorite_styles: "bouldery, ice", current_level: "5.11c", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/javier-vaquero_lqx9uc.jpg")
User.create!(username: "Diego", email: "diego@email.com", password: "123456", route_setter: true,location: "Guadalajara, Mexico", bio: "Climbing trees since I was a child, now ready to get into more challenging routes!", favorite_styles: "crimpy, overhang", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144153/Students%20photos/diego-ulibarri_qepsrc.jpg")
User.create!(username: "Robert", email: "robert@email.com", password: "123456", route_setter: true, location: "Sydney, Australia", bio: "Former skater, I transitioned into climbing recently but getting good pretty fast!", favorite_styles: "crimpy, sloppy", current_level: "5.9+", avatar_photo: "https://res.cloudinary.com/jmadridvaquero/image/upload/v1559144155/Students%20photos/robert-simon_jx82ah.jpg")
if lots_users
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
end


puts "creating sites, cities and states/provinces..."


sites = ["Rumney", "Montreal", "Kamouraska"]

sites_url = { "Rumney" => "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=43.8053486&lon=-71.8125811&maxDistance=200&minDiff=5.6&maxDiff=5.14&maxResults=25&key=200477633-18e31fe418ce3dd71aa4b54df54fa7e0",
 "Montreal" => "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=45.50884&lon=-73.58781&maxDistance=200&minDiff=5.6&maxDiff=5.14&maxResults=250&key=200477633-18e31fe418ce3dd71aa4b54df54fa7e0",
 "Kamouraska" => "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=47.5661&lon=-69.866&maxDistance=200&minDiff=5.6&maxDiff=5.14&maxResults=25&key=200477633-18e31fe418ce3dd71aa4b54df54fa7e0"
}

if default == false
  puts "How many sites do you want between 1 and 3"
  number_sites = STDIN.gets.chomp.to_i
  sites = sites.sample(number_sites)
  puts "Creating #{sites.count} site(s) : #{sites}"
end

# state_province = StateProvince.create!(name: "Quebec")
# city = City.create!(name: "Montreal", state_province: state_province)
# Site.create!(name: "Mont-Trenchant", city: city)

# state_province = StateProvince.create!(name: "Quebec")
# city = City.create!(name: "Kamouraska", state_province: state_province)
# Site.create!(name: "St-Andre Cliffs", city: city)


# state_province = StateProvince.create!(name: "New Hampshire")
# city = City.create!(name: "Dorchester", state_province: state_province)
# Site.create!(name: "Rumney", city: city)

# state_province = StateProvince.create!(name: "Nuevo Leon")
# city = City.create!(name: "Hidalgo", state_province: state_province)
# Site.create!(name: "Potrero Chico", city: city)

sites.each do |site|

  puts "creating routes for #{site}..."
  response = RestClient.get sites_url[site]
  routes = JSON.parse(response)
  puts "#{site} parsed"
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

      next if route["imgMedium"].nil?

    new_route = Route.create!(user: User.all.sample, name: route["name"], site: site, type_of: route["type"], level: route["rating"], rating: route["stars"].to_i, longitude: route["longitude"].to_f, latitude: route["latitude"].to_f)
    Photo.create!(imageable: new_route, photo: route["imgMedium"])
    puts "--- #{new_route.name} created"

    new_route.save!
  end
  sleep 3
end

descriptions = [
"A stellar pitch with meaty business. New beta may have softened the grade. After clipping the first bolt work up unique schist scoops, pinches, and crimps past small gear until you reach a stance at the third bolt. Chalk up a half dozen times and catch your breath. From here it's obvious what you're shooting for but can you figure out how to get there? Get through the business and trend right to a crack with gear and secure holds. Continue around the left of a bulge to a two-bolt anchor. But wait, there's more! There is now an additional 20 ft. of climbing with an awesome one-move crux. Clip the anchors with a double length sling and trend up and left until you can clip the high bolt. Pull through and mantle to a second anchor shared with Maybe God's a Trad Climber. If rappelling from the second anchor you NEED a 60 meter rope. Nothing shorter will reach",
"I consider this a must-do route at Bone Mountain. G-rated climbing on a 95 degree overhanging crack system. No move harder than 5.9 but the pump builds up! Begin just right of the tree growing out from the wall and take on the small roof with surprisingly easy stemming and big holds. Romp straight up the face on excellent incut holds following the crack system for gear. A tricky ending guards the final clip, be ready! Ends at a two-bolt anchor at the lip.",
"Originally led onsight on gear which shall not be discussed without any bolts in place. Work up the hand crack until the gear runs out and aim for a pair of bolts and excellent incut edges until you can surmount the right side of the pillar. Place one more cam and finish on easier terrain with a two-bolt anchor.",
"Dirty to start but stick with it. It's worth it! Stem up past the tree and boulder through a short unpleasant dirty section. Continue up small holds to a ledge. Work up from the ledge to a high bolt and cruise up 40 feet of interesting edges and crimps with good feet. Surmount the bulge with high reaches (Asya is 5.4 so not that high!) and mantle the bulge before romping up jugs to a ledge with a two-bolt anchor.",
"Well lets face it, you don't come to this site to climb cracks. This route affirms that statement with its ironic name. This climb follows a crack where water drains which leaves the route dirty. I think I used more offwidth technique than hand jamming. I even heard Ben Crawford backed down off this climb...",
"Climb up easy 5.9 section to a very large hold below the white colored rock. A heel hook on this hold can score you a no-hands. Move left several feet and then up, up, up. Crux it out from here to the anchors.",
"Another good route on the Mileski Wall. This one is located just left of the two 11d's and just right of Permanent Vacation and Mano De Dios.",
"Steep crack climbing and technical face climbing mulitpitch, following a natural line on the left side of the Mileski wall. This and Devotion are the only routes that goes to the top of this wall. 70m rope mandatory. Can link 3+4, and 13+14.",
"Please try it, and leave feedback here! This is a new route, and use a trad mentality to test holds, have awareness of loose rock especially at the top, and be careful for those below. Have fun. P1 5.11. Start on the ledge left of Permanent Vacation. Work left through lower-angle grey face to reach an obvious crack. Steep locks and stemming to the top. 32m, 9 bolts. P2 5.12\+ Continue the pumpy crack for 5m to a rest, then 20m of continuous techy face climbing on excellent edges and pockets. 27m, 12 bolts.",
"Starts up dark slab then trends up and right. The first pitch is the easiest pitch at the Mileski Wall (the second easiest pitch in this area is the first pitch of Chutes and Ladders, which is 5.10d.",
"4 routes on the right of Bonsaï. The names of the routes and the grades are written on the stone. Can't miss it.",
"If you climb this one on top rope from Bonsai anchor, make sure it is not a project or at your limit. The start is a bit left of the top rope line and a fall would probably be sketchy. Climb between the crack and the corner.",
"The start is not that hard then you get to then roof. Find your positioning and you will make that launch to the jug. You can expect your feet to swing loose but you will hold that jug and pull yourself atop. Easy climbing to the anchor.",
"Start with a ringlock/jam in the crack on the backside of the boulder. Use a series of toe hooks, heel hooks, and bicycles to work your way under the roof traverse. Pop out on the other side onto a good ledge and use crimps to gain access to the slopey topout.",
"Montreal Steak Seasoning climbs the outside of the Tunnel Boulder. P1-9+, 80\', 10 bolts Chimney to the outside of the Tunnel Boulder, step on, highstep the overlap, and continue up the arete to anchor. P2-7, 80\', mostly gear and few bolts: Step across gap and follow the slabby crack system to anchor.",
"A must do if you climb in this site. From the first anchor, go left and up the dihedral. You will then negotiate a small roof by going a little right. Go up another dihedral and finish on the slab to get to the anchor."
]


# ------------- style
styles = [
"crimpy", "pumpy", "bouldery", "overhang", "sloppy", "technical", "balanced"
]




Route.all.each do |route|
  route.description = descriptions[rand(0..descriptions.length)]
  route.style = styles[rand(0..styles.length)]
  route.save
end

puts "You have #{Route.count} routes"

puts "creating random trips for everyone.."

t = Time.now
User.all.each do |user|
  rand(3).times do
    trip = Trip.create!(user: user, start_date: t, end_date: t)
    Route.all.sample(rand(5)).each do |route|
      RouteTrip.create!(route: route, trip: trip)
    end
  end
end



 puts "seeds done!"
 puts "you have #{User.count} users with an average of #{Trip.count/User.count} each and #{Route.count} routes ! Enjoy !!"
