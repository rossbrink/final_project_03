# == Schema Information
#
# Table name: spoken_languages
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#  provider_id :integer
#
class SpokenLanguage < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id", :counter_cache => true })
  belongs_to(:language, { :required => true, :class_name => "Language", :foreign_key => "language_id", :counter_cache => true })
end
