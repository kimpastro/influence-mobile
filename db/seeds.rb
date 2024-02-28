# Start database with some offers

PASSWORD = 'pass123'.freeze

player = Player.create_with(
  name: 'Dwight Schrute',
  birthday: Time.parse('1990-01-01'),
  gender: 'male',
  password: PASSWORD,
).find_or_initialize_by(email: 'dwight@mobile.com')

unless player.confirmed?
  player.skip_confirmation_notification!
  player.confirm
  player.save
end

if Offer.any?
  puts "There are offers registered already."
  puts "To change that behavior take a look into the db/seeds.rb file and change as you wish."
else
  puts "No offers found."
  puts "Registering random offers."
  25.times { FactoryBot.create(:offer, :for_legal_age, :for_men) }
  25.times { FactoryBot.create(:offer, :for_legal_age, :for_women) }
  25.times { FactoryBot.create(:offer, :for_minors, :for_men) }
  25.times { FactoryBot.create(:offer, :for_minors, :for_women) }
  
  puts "Registering targeted offers."
  15.times { FactoryBot.create(:offer, gender: player.gender, age: player.age) }
end

puts 'Use the following credentials to access the system: '
puts "Email: #{player.email}"
puts "Password: #{PASSWORD}"
