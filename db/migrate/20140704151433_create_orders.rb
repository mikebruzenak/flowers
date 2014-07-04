class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :email
      t.integer :delivery_method

      t.timestamps
    end
  end
end
