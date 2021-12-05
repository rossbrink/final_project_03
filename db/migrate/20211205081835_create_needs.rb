class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.string :name
      t.string :description
      t.integer :services_count

      t.timestamps
    end
  end
end
