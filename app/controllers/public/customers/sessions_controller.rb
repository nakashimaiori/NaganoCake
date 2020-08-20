# frozen_string_literal: true

class Public::Customers::SessionsController < Devise::SessionsController

  protected
  def after_sign_in_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  def reject_user
    customer = Customer.find_by(email: params[:customer][:email].downcase)
    if customer
      if (customer.valid_password?(params[:customer][:password]) && (customer.active_for_authentication? == true))
        redirect_to new_customer_session_path
      end
    end
  end
end
