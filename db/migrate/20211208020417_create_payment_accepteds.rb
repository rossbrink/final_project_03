class CreatePaymentAccepteds < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_accepteds do |t|
      t.integer :payment_type_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
