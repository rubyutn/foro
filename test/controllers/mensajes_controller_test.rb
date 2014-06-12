require 'test_helper'

class MensajesControllerTest < ActionController::TestCase
  setup do
    @mensaje = mensajes :para_luke

    login
  end

  test 'deberia obtener index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:mensajes)
  end

  test 'deberia obtener new' do
    get :new
    assert_response :success
  end

  test 'debería crear mensaje' do
    assert_difference('Mensaje.count') do
      post :create, mensaje: { cuerpo: @mensaje.cuerpo, persona_id: @mensaje.persona_id }
    end

    assert_redirected_to mensaje_url(assigns(:mensaje))
  end

  test 'deberia mostrar mensaje' do
    get :show, id: @mensaje
    assert_response :success
  end

  test 'debería obtener edit' do
    get :edit, id: @mensaje
    assert_response :success
  end

  test 'deberia actualizar mensaje' do
    patch :update, id: @mensaje, mensaje: {
      cuerpo: 'Y Leia es tu hermana', persona_id: @mensaje.persona_id
    }
    assert_redirected_to mensaje_url(assigns(:mensaje))
  end

  test 'should destroy mensaje' do
    assert_difference('Mensaje.count', -1) do
      delete :destroy, id: @mensaje
    end

    assert_redirected_to mensajes_url
  end
end
