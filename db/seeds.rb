# Start database with some random offers

100.times do
  Offer.create(
    {
      description: Fakker::Marketing.buzzwords
      gender: 
      age: 
    }
  )
end
