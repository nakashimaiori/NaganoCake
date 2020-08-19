# frozen_string_literal: true

class Public::Customers::SessionsController < Devise::SessionsController

  protected
  def after_sign_in_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end
end
