# == Schema Information
#
# Table name: payment_accepteds
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  payment_type_id :integer
#  provider_id     :integer
#
class PaymentAccepted < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id" })
  belongs_to(:payment_type, { :required => true, :class_name => "PaymentType", :foreign_key => "payment_type_id" })
end
