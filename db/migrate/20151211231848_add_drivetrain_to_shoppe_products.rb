class AddDrivetrainToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :drivetrain, :string
  end
end
