class UserParticipationsController < ApplicationController
  def create
    @user_participation = UserParticipation.new
    @event = Event.find(params[:event_id])
    @user_participation.event = @event
    @user_participation.user = current_user

    if @user_participation.save
      redirect_to event_path(@user_participation.event.id), notice: 'Cet évènement a été ajouté à votre liste.'
    else
      render :new
    end
  end

  def destroy
    @user_participation = UserParticipation.find(params[:id])
    # @user_participation.destroy
    # Si il y a 2 participations pour le meme utilisateur, on supprime les 2
    a = UserParticipation.where(user: current_user, event: @user_participation.event)
    a.destroy_all
    redirect_to event_path(@user_participation.event.id), notice: 'Evènement supprimé de votre liste.'
  end

  private

  def user_participation_params
    params.require(:user_participation).permit(:user_id, :event_id)
  end
end
