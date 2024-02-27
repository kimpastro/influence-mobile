# Start database with some offers

if Offer.any?
  puts "There are offers registered already."
  puts "To change that behavior take a look into the db/seeds.rb file and change as you wish."
else
  puts "No offers found, registering offers."
  25.times { FactoryBot.create(:offer, :for_legal_age, :for_men) }
  25.times { FactoryBot.create(:offer, :for_legal_age, :for_women) }
  25.times { FactoryBot.create(:offer, :for_minors, :for_men) }
  25.times { FactoryBot.create(:offer, :for_minors, :for_women) }
  puts "Done"
end
