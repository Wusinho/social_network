class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show ]

  def show
    @friends = current_user.friend_with?(@user)
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end

end
