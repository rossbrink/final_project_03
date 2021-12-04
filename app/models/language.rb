class Language < ApplicationRecord
  has_many(:spoken_languages, { :class_name => "SpokenLanguage", :foreign_key => "language_id", :dependent => :destroy })
end
