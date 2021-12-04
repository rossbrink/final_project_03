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

end
