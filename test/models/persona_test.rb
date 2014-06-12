require 'test_helper'

class PersonaTest < ActiveSupport::TestCase
  setup do
    @persona = personas :anakin
  end

  test 'el nombre y el apellido no pueden estar en blanco' do
    @persona.nombre = ''
    @persona.apellido = ''

    assert @persona.invalid?
    assert @persona.errors[:nombre].include?('no puede estar en blanco')
    assert @persona.errors[:apellido].include?('no puede estar en blanco')
  end

  test 'buscar' do
    resultados = Persona.buscar 'luke'

    assert resultados.any?
    assert resultados.all? { |p| p.to_s =~ /luke/i }
  end
end
