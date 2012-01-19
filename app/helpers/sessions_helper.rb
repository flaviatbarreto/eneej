module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(session[:id_user])
  end
  
  def current_user?(user)
    @current_user == user
  end

  def logged_in?
		current_user ? true : false
  end
end
