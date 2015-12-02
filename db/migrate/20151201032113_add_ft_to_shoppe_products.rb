class AddFtToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :fuel_type, :string
  end
end
