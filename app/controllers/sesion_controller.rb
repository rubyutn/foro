class SesionController < ApplicationController
  def new
  end

  def create
    persona = Persona.find_by(correo: sesion_params[:correo])

    if persona && persona.authenticate(sesion_params[:password])
      session[:persona_id] = persona.id
      redirect_to personas_url, notice: t('.notice')
    else
      flash.now.alert = t('.alert')
      render 'new'
    end
  end

  def destroy
    session[:persona_id] = nil

    redirect_to root_url, notice: t('.notice')
  end

  private

    def sesion_params
      params.require(:sesion).permit(:correo, :password)
    end
end
