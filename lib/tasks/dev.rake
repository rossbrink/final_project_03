desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

require 'faker'

Neighborhood.destroy_all

# UKRAINIAN VILLAGE
neighborhood = Neighborhood.new
neighborhood.id = 1
neighborhood.name = "Ukrainian Village"
neighborhood.save

# WICKER PARK
neighborhood = Neighborhood.new
neighborhood.id = 2
neighborhood.name = "Wicker Park"
neighborhood.save

# ROSCOE VILLAGE
neighborhood = Neighborhood.new
neighborhood.id = 3
neighborhood.name = "Roscoe Village"
neighborhood.save

# PILSEN
neighborhood = Neighborhood.new
neighborhood.id = 4
neighborhood.name = "Pilsen"
neighborhood.save

# LAKEVIEW
neighborhood = Neighborhood.new
neighborhood.id = 5
neighborhood.name = "Lakeview"
neighborhood.save

Language.destroy_all

# ENGLISH
language = Language.new
language.id = 1
language.name = "English"
language.save

# SPANISH
language = Language.new
language.id = 2
language.name = "Spanish"
language.save

# POLISH
language = Language.new
language.id = 3
language.name = "Polish"
language.save

# UKRAINIAN
language = Language.new
language.id = 4
language.name = "Ukrainian"
language.save

# ARABIC
language = Language.new
language.id = 5
language.name = "Arabic"
language.save


Need.destroy_all

# AUTISM
need = Need.new
need.id = 1
need.name = "Autism"
need.description = "xxxx"
need.save

# DOWN SYNDROME
need = Need.new
need.id = 2
need.name = "Down Syndrome"
need.description = "xxxx"
need.save

# CEREBRAL PALSY
need = Need.new
need.id = 3
need.name = "Cerebral Palsy"
need.description = "xxxx"
need.save

# ADHD
need = Need.new
need.id = 4
need.name = "ADHD"
need.description = "xxxx"
need.save

# CYSTIC FIBROSIS
need = Need.new
need.id = 5
need.name = "Cystic Fibrosis"
need.description = "xxxx"
need.save

# # ADD PROVIDERS
Provider.destroy_all

10.times do
  provider = Provider.new
  provider.description = Faker::Restaurant.description
  provider.first_name = Faker::Name.first_name
  # placeholder_image = Faker::Placeholdit.image
  # provider.image = https://api.cloudinary.com/v1_1/ENV.fetch("CLOUDINARY_NAME")/image/upload -X POST --data 'file=placeholder_image&api_key=ENV.fetch("CLOUDINARY_TOKEN")'
  # provider.image = Faker::Placeholdit.image
  provider.remote_image_url = "https://thispersondoesnotexist.com/image"
  provider.last_name = Faker::Name.last_name
  provider.email = provider.first_name.downcase + "@email.com"
  provider.password = "password"
  provider.price = Faker::Number.within(range: 5..25)

  lang = SpokenLanguage.new
  # lang.provider_id = rand(1..10)
  lang.language_id = rand(1..5)
  lang.save

  provider.save
end

ross = Provider.new
ross.id = 1
ross.description = "Just a good-ass dood."
ross.first_name = "Ross"
ross.last_name = "Brinkman"
ross.email = "ross@email.com"
ross.password = "password"
ross.price = 14.99
ross.remote_image_url = "https://uc54beba0cdf0523087732e1ecd4.previews.dropboxusercontent.com/p/thumb/ABW8tO9npJz-XO3q-cSUxG_TFisH85im8rmQWfpS8pWTKuPsLmmxI14odlvlqvTrCtdyUvcCpvNPaAtB87wbKmzvNJ5uj2lHBFLJf1sqav0tg_sAC_mMdkyXbTHJHWP7dktbltwLqlKgq-_IwV4vT-AYCf8rD2YOxbAliLI7kD77Q_XLaS-RqxWtKJ3wnnWfdRbc1R9ExHWbqt0ROSAbMA4yFDstrqYHK95zVCXoBZpJYhVXbtMIch4ZVLLud0xgCFOHLb-LRtpXUDdZbcpefYRmbclxyK4_gOrbDzggbAejiyx2kkg5WJ6XdPTd8KXCPFjWKoVI6cHvsQ3e7kxyi17Vm5T2Rr-MpL1zitAlXi2oMlWFaDKiUTxTk2JkIATI0ts/p.jpeg"
ross.save

# wartortle = Provider.new
# wartortle = Provider.new
# wartortle.description = "Squirt squirt."
# wartortle.first_name = "Wartortle"
# wartortle.last_name = "Pokemon"
# wartortle.email = "wartortle@email.com"
# wartortle.password = "password"
# wartortle.price = 15.99
# wartortle.save

# bulbasaur = Provider.new
# bulbasaur = Provider.new
# bulbasaur.description = "Plants n' shit."
# bulbasaur.first_name = "Bulbasaur"
# bulbasaur.last_name = "Pokemon"
# bulbasaur.email = "bulbasaur@email.com"
# bulbasaur.password = "password"
# bulbasaur.price = 12.99
# bulbasaur.save

# # ADD USER
# User.destroy_all

# user = User.new
# user.id = 1
# user.email = "user@email.com"
# user.first_name = "Sarah"
# user.last_name = "Rosenwinkel"
# user.password = "password"
# user.save

end