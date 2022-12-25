# frozen_string_literal: true

class RoomsController < ApplicationController

  def show
    @room = Room.finder(current_user.id, params[:id])
    puts '*'*100
    puts @room
    puts '*'*100
    render json: {
      room: @room,
      status: 'found'
    }
  end

end
