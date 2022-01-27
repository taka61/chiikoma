# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    chiikomas_path
  end

  def after_sign_up_path_for(_resource)
    chiikomas_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def configure_permitted_parameters
    added_attrs = %i[email name password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
