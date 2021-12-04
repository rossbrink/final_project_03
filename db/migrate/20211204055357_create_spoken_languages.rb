class CreateSpokenLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :spoken_languages do |t|
      t.integer :provider_id
      t.integer :language_id

      t.timestamps
    end
  end
end
