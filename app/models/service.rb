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
end
