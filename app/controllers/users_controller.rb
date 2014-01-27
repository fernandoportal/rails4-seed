class UsersController < ApplicationController
  
  skip_before_filter :check_user_data, only: [:edit, :update]
  before_filter :signed_in?, only: [:edit, :update]
  
  # this action is used to get the signed in user to update his/her data
  def edit
    @user = current_user
  end
  
  # updates the signed in information
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :gender)
  end
  
end
