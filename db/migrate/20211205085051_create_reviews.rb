class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :provider_id
      t.integer :author_id
      t.integer :rating
      t.text :description
      t.text :title

      t.timestamps
    end
  end
end
