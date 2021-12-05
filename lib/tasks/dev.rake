desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

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

end
