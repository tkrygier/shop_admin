class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def admin_logged!
    if user_signed_in? && current_user.is_admin
      return
    elsif user_signed_in?
      flash[:notice] = 'You must be an admin to do that'
      redirect_to new_user_session_path
    else
      flash[:notice] = 'You need to sign in first'
      redirect_to new_user_session_path
    end
  end
end
