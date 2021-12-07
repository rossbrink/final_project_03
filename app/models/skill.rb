# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider_id :integer
#  task_id     :integer
#
class Skill < ApplicationRecord
  belongs_to(:provider, { :required => true, :class_name => "Provider", :foreign_key => "provider_id" })
  belongs_to(:task, { :required => true, :class_name => "Task", :foreign_key => "task_id" })

  validates(:task_id, { :uniqueness => { :scope => [:provider_id] }})
end
