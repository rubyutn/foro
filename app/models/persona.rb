class Persona < ActiveRecord::Base
  validates :nombre, :apellido, presence: true
end
