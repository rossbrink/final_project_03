# == Schema Information
#
# Table name: languages
#
#  id                     :integer          not null, primary key
#  name                   :string
#  spoken_languages_count :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Language < ApplicationRecord
  has_many(:spoken_languages, { :class_name => "SpokenLanguage", :foreign_key => "language_id", :dependent => :destroy })
  has_many(:providers, { :through => :spoken_languages, :source => :provider })
end
