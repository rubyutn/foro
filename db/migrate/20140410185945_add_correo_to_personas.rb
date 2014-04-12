class AddCorreoToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :correo, :string
  end
end
