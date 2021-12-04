# == Schema Information
#
# Table name: providers
#
#  id                     :integer          not null, primary key
#  description            :string
#  email                  :string
#  first_name             :string
#  image                  :string
#  last_name              :string
#  password_digest        :string
#  price                  :float
#  reviews_count          :integer
#  services_count         :integer
#  spoken_languages_count :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Provider < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:reviews, { :class_name => "Review", :foreign_key => "provider_id", :dependent => :destroy })

  has_many(:spoken_languages, { :class_name => "SpokenLanguage", :foreign_key => "provider_id", :dependent => :destroy })

  has_many(:services, { :class_name => "Service", :foreign_key => "provider_id", :dependent => :destroy })
end
