class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.integer :neighborhood_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
