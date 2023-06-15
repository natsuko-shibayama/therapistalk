class UsersController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def show

  end
  
  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :job, :description)
  end

  def set_item
    @user = User.find(params[:id])
  end

end
