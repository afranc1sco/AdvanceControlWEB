class CreateMotivosnoventa < ActiveRecord::Migration
  def change
    create_table :motivosnoventa do |t|
      t.string :motivo
      t.string :clave
      t.boolean :status

      t.timestamps null: false
    end
  end
end
