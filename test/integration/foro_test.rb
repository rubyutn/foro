require 'test_helper'

class ForoTest < ActionDispatch::IntegrationTest
  test 'ingresar y ver personas y mensajes' do
    get '/'
    assert_response :success

    post_via_redirect '/sesion', sesion: {
      correo: personas(:anakin).correo,
      password: '123'
    }

    assert_equal '/personas', path

    get '/mensajes'
    assert_response :success
    assert assigns(:mensajes)
  end
end
