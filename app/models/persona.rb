class Persona < ActiveRecord::Base
  validates :nombre, :apellido, presence: true

  def self.buscar termino
    where 'nombre LIKE :t OR apellido LIKE :t', t: "#{termino}%"
  end
end
