class UsersController < ApplicationController

  def edit
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :occupation, :position)
  end

end
