class CreateMvodev < ActiveRecord::Migration
  def change
    create_table :mvodev do |t|
      t.string :MvoDev
      t.string :Clave
      t.string :Status

      t.timestamps null: false
    end
  end
end
