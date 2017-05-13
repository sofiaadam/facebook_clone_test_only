class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Account created. Please log in now."
            redirect_to @user
        else
            flash[:alert] = "Error creating account: #{@user.email}"
            render new_user_path
        end
        
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Account is updated successfully."
            redirect_to user_path(@user)
        else
            flash[:alert] = "Update unsuccesful, please try again"
            render "edit"
        end
        
    end

    def destroy
        @user = User.find(params[:id])
            if @user.destroy
            flash[:notice] = "Account is deleted"
            redirect_to statuses_path
        end
    end
    
    
    
    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
