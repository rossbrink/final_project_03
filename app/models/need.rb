# == Schema Information
#
# Table name: needs
#
#  id             :integer          not null, primary key
#  description    :string
#  name           :string
#  services_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Need < ApplicationRecord
end
