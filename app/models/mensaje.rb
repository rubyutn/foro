class Mensaje < ActiveRecord::Base
  validates :cuerpo, :persona, presence: true

  belongs_to :persona
end
