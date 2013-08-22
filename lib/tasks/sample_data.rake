namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_calendars
    make_calendar_items
    make_actions
	end
end

def make_users
	User.create!(	name: "Example User",
					email: "example@railstutorial.org",
					password: "foobar",
					password_confirmation: "foobar",
					admin: true)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(	name: name,
						email: email, 
						password: password, 
						password_confirmation: password)
	end
end

def make_calendars
	users = User.all(limit: 6)
  i=0
	5.times do
    i += 1
		start_date = i.hour.from_now
		users.each{ |user| user.calendars.create!(start_date: start_date, how_often: 'everyday', how_long: '1month')}
	end
end

def make_actions
	calendars = Calendar.all
  calendars.each{ |calendar| calendar.actions.create!(command: Faker::Lorem.sentence(10))}
end