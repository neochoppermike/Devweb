class AgainAddPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :numeric
  end
end
