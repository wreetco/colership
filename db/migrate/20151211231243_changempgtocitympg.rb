class Changempgtocitympg < ActiveRecord::Migration
  def change
		rename_column :shoppe_products, :mpg, :mpg_city
  end
end
