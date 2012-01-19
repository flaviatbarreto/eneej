class SessionsController < ApplicationController
  before_filter :redirect_if_logged, :only => :new
  def new
  end
  
  def create
   if @user= User.authenticate(params[:name],params[:pass])
      session[:id_user] = @user.id
      flash[:alert]="Usuario Logado"
      redirect_to root_path
    
    else
     flash[:alert]="Usuario/Senha Incorretos ! "
     render :new
    end
  end 

  def destroy
    session[:id_user] = nil
    redirect_to root_path
  end

	private
	def redirect_if_logged
		if logged_in? 
			redirect_to root_path
		end
	end

end
