# frozen_string_literal: true

class RoomsController < ApplicationController

  def show
    @room = Room.finder(current_user.id, params[:id])
  end

end
