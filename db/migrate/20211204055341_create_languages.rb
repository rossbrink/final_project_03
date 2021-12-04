class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :spoken_languages_count

      t.timestamps
    end
  end
end
