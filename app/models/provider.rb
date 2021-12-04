class Provider < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:reviews, { :class_name => "Review", :foreign_key => "provider_id", :dependent => :destroy })

  has_many(:spoken_languages, { :class_name => "SpokenLanguage", :foreign_key => "provider_id", :dependent => :destroy })

  has_many(:services, { :class_name => "Service", :foreign_key => "provider_id", :dependent => :destroy })
end
