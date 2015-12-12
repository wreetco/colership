class AddMileageToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :mileage, :string
  end
end
