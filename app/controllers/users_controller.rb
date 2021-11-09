class UsersController < ApplicationController


    def show
      @user =User.find_by(id: session[:user_id])

      @user_email = @user.email
      
    end
end
