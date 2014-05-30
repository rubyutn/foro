class AddPasswordDigestToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :password_digest, :string
  end
end
