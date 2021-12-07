class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :task_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
