class AddInteriorToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :interior, :string
  end
end
