class TalksController < ApplicationController
  # before_action :authenticate_user!

  def index
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
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def talk_params
    params.require(:talk).permit(:title, :content).merge(user_id: current_user.id)
  end
end
