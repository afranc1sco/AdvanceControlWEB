class AddmodeloYearToVehiculo < ActiveRecord::Migration
  def change
    add_column :vehiculos,:Modelo_year, :string, limit:4
  end
end
