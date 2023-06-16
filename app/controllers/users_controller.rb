class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show

  end
  
  def edit
    if current_user.id != @user.id
      redirect_to root_path
    end
  end



  def update
    if current_user.id != @user.id
      redirect_to root_path
    end

    # ニックネーム、ジョブ、自己紹介文がすべて空欄じゃない場合
    if !user_params[:nickname].empty? && !user_params[:job].empty? && !user_params[:description].empty?
      # UPDATE文で更新
      args = [
        'UPDATE users SET nickname = ?, job = ?, description = ? WHERE id = ?',
        user_params[:nickname],
        user_params[:job],
        user_params[:description],
        @user.id
      ]
      sql = ActiveRecord::Base.send(:sanitize_sql_array, args)
      ActiveRecord::Base.connection.execute(sql)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :job, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
