class ApplicationController < ActionController::Base
  require 'rqrcode'
  include Pundit

  def show
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource) # DEVISE: configura qual rota o usuário é direcionado após logar
    request.env['omniauth.origin'] || stored_location_for(resource) || welcome_index_path
  end

  def after_sign_out_path_for(resource) # DEVISE:  configura qual rota o usuário é direcionado após fazer logout
    request.env['omniauth.origin'] || stored_location_for(resource) || welcome_index_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def user_not_authorized # PUNDIT: Caso o usuário não tenha permição
        flash[:danger] = "Você não tem permição para executar esta ação." # Essa flash :notice deve ser disponibilizada no layout admin
        redirect_to(request.referrer || root_path) # Redireciona para essa rota.
    end
end
