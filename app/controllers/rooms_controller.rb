# frozen_string_literal: true

class RoomsController < ApplicationController

  def create
    @room = current_user.build.room(room_params)
    if @room.save
      p @room
    else
      p 'not saved'
    end
  end

  private

  def room_params
    require.params(:room).permit(:friend_id)
  end

end
