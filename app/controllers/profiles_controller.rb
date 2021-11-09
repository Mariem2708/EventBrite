class ProfilesController < ApplicationController
def index
  @user = User.all 
end 

  def show
    received_id = params[:id]
    @user = User.find(received_id)
    @user_first_name = @user.first_name
    @user_last_name = @user.last_name
    @user_description = @user.description
    @user_email = @user.email
    
  end
end 

