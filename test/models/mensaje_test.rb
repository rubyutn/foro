require 'test_helper'

class MensajeTest < ActiveSupport::TestCase
  setup do
    @mensaje = mensajes :para_luke
  end

  test 'el cuerpo y la pesona no pueden estar en blanco' do
    @mensaje.cuerpo = ''
    @mensaje.persona = nil

    assert @mensaje.invalid?
    assert @mensaje.errors[:cuerpo].include?('no puede estar en blanco')
    assert @mensaje.errors[:persona].include?('no puede estar en blanco')
  end
end
