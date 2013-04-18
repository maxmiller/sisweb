class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  def get_user
    @current_user = current_user
  end

  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
end
