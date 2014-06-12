require 'test_helper'

class SesionControllerTest < ActionController::TestCase
  setup do
    @persona = personas :anakin
  end

  test 'deberia obtener new' do
    get :new
    assert_response :success
  end

  test 'deberia crear sesion' do
    post :create, sesion: { correo: @persona.correo, password: '123' }
    assert_redirected_to personas_url
  end

  test 'no deberia crear sesion' do
    post :create, sesion: { correo: @persona.correo, password: 'incorrecto' }
    assert_response :success
    assert_not_nil flash[:alert]
    assert_nil session[:persona_id]
  end

  test 'deberia destruir la sesion' do
    delete :destroy
    assert_redirected_to root_url
  end
end
