class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    # @reviews = current_user.reviews
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :birthday, :introduction)
  end
end
