class ChangeDelieveryMethod < ActiveRecord::Migration
  def change
    change_column :orders, :delivery_method, :string
  end
end
