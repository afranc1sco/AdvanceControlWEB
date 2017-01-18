class AddCoverToActivos < ActiveRecord::Migration
  def change
    remove_column :activos,:Imagen

    add_attachment :activos,:cover
  end
end
