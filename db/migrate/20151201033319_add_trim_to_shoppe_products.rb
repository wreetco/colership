class AddTrimToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :trim, :string
  end
end
