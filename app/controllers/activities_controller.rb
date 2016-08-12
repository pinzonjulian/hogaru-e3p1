class ActivitiesController < ApplicationController

  before_action :authenticate_user!, except: [:stats]

  def setup
    @user = current_user
  end

  def new
    @activity = Activity.new
  end

  def create
    redirect_to root_url and return unless current_user.activities.exists?(params[:id])
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
    redirect_to root_url and return unless current_user.activities.exists?(params[:id])
    @activity = current_user.activities.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = "Activity updated!"
      redirect_to activities_path
    else
      render 'edit'
    end
  end

  def edit
    redirect_to root_url and return unless current_user.activities.exists?(params[:id])
    @activity = current_user.activities.find(params[:id])
  end

  def destroy
    redirect_to root_url and return unless current_user.activities.exists?(params[:id])
    @activity = current_user.activities.find(params[:id]).destroy
    flash[:success] = "Activity deleted"
    redirect_to activities_path
  end

  def index
    @activities = current_user.activities.page(params[:page])
  end

  def show
  end

  def stats
    @user = current_user || User.find_by(view_token: params[:token])
  end

  def share_stats
    # @user = current_user
  end

  def send_token
    UserMailer.view_stats(params[:email], current_user).deliver_now
    flash[:info] = "Stats shared!"
    redirect_to root_url
  end

  private

    def activity_params
      params.require(:activity).permit(:name, :calories, :burnt, :date, :user_id )
    end

end
