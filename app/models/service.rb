# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  need_id     :integer
#  provider_id :integer
#
class Service < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id", :counter_cache => true })
  belongs_to(:need, { :required => true, :class_name => "Need", :foreign_key => "need_id", :counter_cache => true })
end
