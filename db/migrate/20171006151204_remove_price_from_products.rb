class RemovePriceFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price, :decimal
  end
end
