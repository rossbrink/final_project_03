desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

require 'faker'

User.destroy_all

sarah = User.new
sarah.id = 1
sarah.first_name = "Sarah"
sarah.last_name = "Rosenwinkel"
sarah.email = "sarah@email.com"
sarah.password = "password"
sarah.save

steve = User.new
steve.id = 2
steve.first_name = "Steve"
steve.last_name = "Compere"
steve.email = "steve@email.com"
steve.password = "password"
steve.save

tay = User.new
tay.id = 3
tay.first_name = "Taylor"
tay.last_name = "Brinkman"
tay.email = "tay@email.com"
tay.password = "password"
tay.save

lena = User.new
lena.id = 4
lena.first_name = "Lena"
lena.last_name = "Ferrara Mullen"
lena.email = "lena@email.com"
lena.password = "password"
lena.save

jimmy = User.new
jimmy.id = 5
jimmy.first_name = "Jimmy"
jimmy.last_name = "Dwyer"
jimmy.email = "jimmy@email.com"
jimmy.password = "password"
jimmy.save

PaymentType.destroy_all

# CASH
cash = PaymentType.new
cash.id = 1
cash.name = "Cash"
cash.url = "https://en.wikipedia.org/wiki/Cash"
cash.save

# CHECK
check = PaymentType.new
check.id = 2
check.name = "Check"
# check.url = "https://en.wikipedia.org/wiki/Cash"
check.save

# VENMO
venmo = PaymentType.new
venmo.id = 3
venmo.name = "Venmo"
venmo.url = "https://venmo.com/"
venmo.save

# PAYPAL
paypal = PaymentType.new
paypal.id = 4
paypal.name = "Paypal"
paypal.url = "https://www.paypal.com/us/home"
paypal.save

# CASH APP
cashapp = PaymentType.new
cashapp.id = 5
cashapp.name = "Cash App"
cashapp.url = "https://cash.app/"
cashapp.save

Task.destroy_all

# BABYSITTING
task = Task.new
task.id = 1
task.name = "Babysitting"
task.save

# CPR
task = Task.new
task.id = 2
task.name = "CPR"
task.save

# DIAPER CHANGING
task = Task.new
task.id = 3
task.name = "Diaper Changing"
task.save

# WALKING ASSISTANCE
task = Task.new
task.id = 4
task.name = "Walking Assistance"
task.save

# LICENSED THERAPIST
task = Task.new
task.id = 5
task.name = "Licensed Therapist"
task.save


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

50.times do
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
  provider.price = Faker::Number.within(range: 10..50)

  provider.save

  english = SpokenLanguage.new
  english.provider_id = provider.id
  english.language_id = 1
  english.save

  lang = SpokenLanguage.new
  lang.provider_id = provider.id
  lang.language_id = rand(0..5)
  lang.save

  5.times do 
    hood = Area.new
    hood.provider_id = provider.id
    hood.neighborhood_id = rand(1..5)
    hood.save
  end

  5.times do 
    skill = Skill.new
    skill.provider_id = provider.id
    skill.task_id = rand(1..5)
    skill.save
  end

  5.times do 
    service = Service.new
    service.provider_id = provider.id
    service.need_id = rand(1..5)
    service.save
  end

  5.times do 
    review = Review.new
    review.provider_id = provider.id
    review.title = Faker::Marketing.buzzwords.capitalize
    review.author_id = rand(1..5)
    review.description = Faker::Restaurant.review
    review.save
  end

  5.times do 
    pay_acc = PaymentAccepted.new
    pay_acc.provider_id = provider.id
    pay_acc.payment_type_id = rand(1..5)
    pay_acc.save
  end

  # provider.save
end

ross = Provider.new
ross.id = 1
ross.description = "Just a good-ass dood."
ross.first_name = "Ross"
ross.last_name = "Brinkman"
ross.email = "ross@email.com"
ross.password = "password"
ross.price = 15
ross.remote_image_url = "https://i.ibb.co/HCK0xSX/ross2.jpg"
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