class AddDateToRelclirutas < ActiveRecord::Migration
  def change
    add_column :relclirutas, :Fecha, :date
  end
end
