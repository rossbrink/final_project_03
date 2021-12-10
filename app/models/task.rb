# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  has_many(:skills, { :class_name => "Skill", :foreign_key => "task_id", :dependent => :destroy })
  has_many(:providers, { :through => :skills, :source => :provider })
end
