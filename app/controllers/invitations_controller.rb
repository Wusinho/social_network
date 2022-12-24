class InvitationsController < ApplicationController

  def index
    @users = User.where.not(id: current_user)
    @pending_invitations = current_user.pending_invitations
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
