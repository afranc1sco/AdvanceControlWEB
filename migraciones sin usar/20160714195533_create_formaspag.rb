class CreateFormaspag < ActiveRecord::Migration
  def change
    create_table :formaspag do |t|
      t.string :forma
      t.string :clave
      t.boolean :status

      t.timestamps null: false
    end
  end
end
