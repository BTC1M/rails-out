class UserStylesController < ApplicationController
  def create
    @user_style = UserStyle.new
    @style = Style.find(params[:format])
    @user_style.style = @style
    @user_style.user = current_user

    if @user_style.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    # @user_style = UserStyle.where(style: Style.find(params[:id]))
    @user_style = UserStyle.find_by(style: Style.find(params[:id]))
    @user_style.destroy
    redirect_to dashboard_path
  end

  private

  def user_style_params
    params.require(:user_style).permit(:style_id, :user_id)
  end
end
