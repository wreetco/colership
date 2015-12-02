class AddColorToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :color, :string
  end
end
