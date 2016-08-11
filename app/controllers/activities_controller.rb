class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:success] = "Activity registered!"
      redirect_to @activity
    else
      render
    end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = "Activity updated!"
      redirect_to @activity
    else
      render 'edit'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

    def activity_params
      params.require(:activity).permit(:name, :cal_intake,
                                       :cal_burnt, :date )
    end

end
