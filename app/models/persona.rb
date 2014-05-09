class Persona < ActiveRecord::Base
  validates :nombre, :apellido, presence: {
    message: 'no puede estar en blanco'
  }
end
