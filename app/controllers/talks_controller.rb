class TalksController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @talks =Talk.all
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to user_path(@talk.user_id)
    else
      render :new
    end
  end

  def show
    @talk = Talk.find(params[:id])
    @user = User.find(@talk.user_id)
    @comment = Comment.new
    @comments = @talk.comments.includes(:user)
  end

  def edit
    @talk = Talk.find(params[:id])
    if current_user.id != @talk.user_id
      redirect_to root_path
    end
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to talk_path(@talk.id)
    else
      render :edit
    end
  end

  def destroy
    talk = Talk.find(params[:id])
    @user = User.find(talk.user_id)
    talk.destroy
    redirect_to user_path(@user)
  end


  private

  def talk_params
    params.require(:talk).permit(:title, :content).merge(user_id: current_user.id)
  end
end
