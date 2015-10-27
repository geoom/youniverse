class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :channel
      t.text :notification_params, null: true
      t.string :status
      t.string :transaction_id
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
