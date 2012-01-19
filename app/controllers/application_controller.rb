class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def login_required
    redirect_to root_path if !current_user  
  end
  
  def admin_required
    if !(current_user.admin? || current_user == params[:id].to_i)
      redirect_to root_path
    end
  end

  protect_from_forgery
end
