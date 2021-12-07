class RemoveSkillsCountFromTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :skills_count, :integer
  end
end
