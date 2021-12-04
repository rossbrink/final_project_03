class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.float :price
      t.string :image
      t.string :description
      t.integer :reviews_count
      t.integer :spoken_languages_count
      t.integer :services_count

      t.timestamps
    end
  end
end
