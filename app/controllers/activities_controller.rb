class ActivitiesController < ApplicationController

  before_action :authenticate_user!

  def setup
    @user = current_user
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user_id = current_user[:id]
    if @activity.save
      user = current_user
      flash[:success] = "Activity registered!"
      redirect_to activities_path
    else
      render 'new'
    end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = "Activity updated!"
      redirect_to activities_path
    else
      render 'edit'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id]).destroy
    flash[:success] = "Activity deleted"
    redirect_to activities_path
  end

  def index
    @activities = Activity.page(params[:page])
  end

  def show
  end

  private

    def activity_params
      params.require(:activity).permit(:name, :cal_intake,
                                       :cal_burnt, :date, :user_id )
    end

end
