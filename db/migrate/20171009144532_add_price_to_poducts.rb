class AddPriceToPoducts < ActiveRecord::Migration[5.1]
  def change
    add_column :poducts, :price, :numeric
  end
end
