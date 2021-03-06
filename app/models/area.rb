# == Schema Information
#
# Table name: areas
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#  provider_id     :integer
#
class Area < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id" })
  belongs_to(:neighborhood, { :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_id" })

  validates(:neighborhood_id, { :uniqueness => { :scope => [:provider_id] }})
end
