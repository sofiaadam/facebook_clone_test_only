class SessionsController < ApplicationController

    def new
    end
   

   def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome, #{@user.email}!"
      log_in(@user)
      redirect_to statuses_path
    else
      flash[:alert] = 'Please log in again'
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

    private

    def session_params
        params.require(:session).permit(:email, :password, :password_confirmation)
    end
    
    def matching_password
        params[:session][:password] == params[:session][:password_confirmation]
    end
    
    
    
end
