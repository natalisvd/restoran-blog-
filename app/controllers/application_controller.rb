
require "application_responder"
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  self.responder = ApplicationResponder
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json


  def angular
    render 'layouts/application'
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end