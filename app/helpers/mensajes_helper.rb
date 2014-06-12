module MensajesHelper
  def mensaje
    flash[:alert] || flash[:notice]
  end

  def clase_mensaje
    flash[:alert] ? 'alert-danger' : 'alert-info'
  end
end
