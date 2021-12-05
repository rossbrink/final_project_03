# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  description :string
#  rating      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  provider_id :integer
#
class Review < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id", :counter_cache => true })
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "author_id", :counter_cache => true })
end
