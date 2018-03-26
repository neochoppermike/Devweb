class AddTimestampsToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :created_at, :datetime, null: true
    add_column :orders, :updated_at, :datetime, null: true
  end
end
