# frozen_string_literal: true

class Public::Customers::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource)
    root_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :customer_status])
  end

end
