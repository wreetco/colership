class AddMpgHighwayToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :mpg_highway, :string
  end
end
