class UserParticipationsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @user_participation = UserParticipation.new
  end

  def create
    @user_participation = UserParticipation.new
    @event = Event.find(params[:event_id])
    @user_participation.event = @event
    @user_participation.user = current_user

    if @user_participation.save
      redirect_to event_path(@user_participation.event.id), notice: 'Participation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user_participation = UserParticipation.find(params[:id])
    @user_participation.destroy
    redirect_to event_path(@user_participation.event.id), notice: 'Participation was successfully destroyed.'
  end

  private

  def user_participation_params
    params.require(:user_participation).permit(:user_id, :event_id)
  end
end
