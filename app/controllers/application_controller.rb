class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_active_storage_current

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:password,:profile,:occupation,:position])
  end

  def set_active_storage_current
    ActiveStorage::Current.url_options = {
      host: request.host,
      protocol: request.protocol
    }
  end
end
