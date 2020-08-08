class UsersController < ApplicationController


    def new 
        @user = User.new
    end

    def show 
        @user = User.find_by(params[:id])
    end

    def create 
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_digest, :nausea, :happiness, :admin, :tickets, :height)
    end

end
