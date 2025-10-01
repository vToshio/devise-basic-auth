class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # configurando do Lazy Way
  PERMITTED_PARAMS = %i[ username fullname ].freeze

  def configure_permitted_parameters
    # Adiciona campos além dos que já existem como permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMITTED_PARAMS)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMITTED_PARAMS)
  end
end