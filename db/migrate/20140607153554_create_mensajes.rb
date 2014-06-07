class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.text :cuerpo
      t.references :persona, index: true

      t.timestamps
    end
  end
end
