class CreateMvomerma < ActiveRecord::Migration
  def change
    create_table :mvomerma do |t|
      t.string :merma
      t.string :clave
      t.boolean :status

      t.timestamps null: false
    end
  end
end
