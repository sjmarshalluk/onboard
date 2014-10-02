# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


rooms = Room.create(
	[
		{
			title: "Tim",
			address: "Andrews Road, London, E8 4RL",
			description: "Bloody lovely place",
			no_of_rooms: 5,
			price_in_pence: 15000,
			is_featured: false,
			user_id: 1
		},
		{
			title: "Steve",
			address: "Vartry Road, London, N15 6HB",
			description: "A bit shoddy",
			no_of_rooms: 2,
			price_in_pence: 75,
			is_featured: true,
			user_id: 1
		}


	]
)

