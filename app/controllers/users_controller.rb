class UsersController < ApplicationController
  def index
    respond_to do |format|
      format.json
    end
  end

  def edit
  end

#  問題 9. グループ編集後のリダイレクト先を変更しよう
  def update
    if current_user.update(user_params)
      redirect_to root_path
      # redirect_to group_messages_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
