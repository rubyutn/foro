require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas :anakin

    login
  end

  test 'debería obtener index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test 'debería obtener new' do
    get :new
    assert_response :success
  end

  test 'debería crear persona' do
    assert_difference('Persona.count') do
      post :create, persona: @persona.dup.attributes.merge(
        password: '123', password_confirmation: '123'
      )
    end

    assert_redirected_to persona_url(assigns(:persona))
  end

  test 'debería mostrar persona' do
    get :show, id: @persona
    assert_response :success
  end

  test 'debería obtener editar' do
    get :edit, id: @persona
    assert_response :success
  end

  test 'debería actualizar persona' do
    patch :update, id: @persona, persona: {
      nombre: 'Darth', apellido: 'Vader', correo: 'darth@vader.me'
    }
    assert_redirected_to persona_url(assigns(:persona))
  end

  test 'debería eliminar persona' do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_url
  end
end
