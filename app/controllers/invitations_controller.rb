class InvitationsController < ApplicationController

  def index
    @users = current_user.valid_friends
    @pending_invitations = current_user.pending_invitations
    @friends = current_user.friends
  end

  def active
    @invitation = Invitation.find(params[:id])
    @invitation.update(confirmed: !@invitation.confirmed)
    @invitation.save!
    Room.create(user_id: @invitation.user_id, friend_id: @invitation.friend_id)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path, notice: "Invitation was successfully accepted." }
    end
  end

  def new
    @invitation = Invitation.new
  end
  def show
    @users = User.where.not(id: current_user)

  end

  def create
    @invitation = current_user.invitations.build(invitation_params)
    # debugger

    respond_to do |format|
      if @invitation.save
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Invitation was successfully accepted." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

  private
  def invitation_params
    params.permit(:friend_id)
  end

end
