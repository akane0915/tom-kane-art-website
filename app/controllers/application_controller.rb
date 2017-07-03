class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_admin

  def after_sign_in_path_for(admins)
    paintings_path
  end

  def after_sign_out_path_for(admins)
    new_admin_session_path
  end

end
