# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer          not null, primary key
#  areas_count :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Neighborhood < ApplicationRecord
  has_many(:areas, { :class_name => "Area", :foreign_key => "neighborhood_id", :dependent => :destroy })
  has_many(:providers, { :through => :areas, :source => :provider })
end
