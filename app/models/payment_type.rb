# == Schema Information
#
# Table name: payment_types
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PaymentType < ApplicationRecord
  has_many(:payment_accepteds, { :class_name => "PaymentAccepted", :foreign_key => "payment_type_id", :dependent => :destroy })
  has_many(:providers, { :through => :payment_accepteds, :source => :provider })
end
