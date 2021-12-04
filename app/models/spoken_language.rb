class SpokenLanguage < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id", :counter_cache => true })
  belongs_to(:language, { :required => true, :class_name => "Language", :foreign_key => "language_id", :counter_cache => true })
end
