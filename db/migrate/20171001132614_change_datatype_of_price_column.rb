class ChangeDatatypeOfPriceColumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :price, :decimal
  end
end