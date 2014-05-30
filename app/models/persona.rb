class Persona < ActiveRecord::Base
  has_secure_password

  validates :nombre, :apellido, presence: true

  def self.buscar termino
    where 'nombre LIKE :t OR apellido LIKE :t', t: "#{termino}%"
  end
end
