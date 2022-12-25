# frozen_string_literal: true

class RoomsController < ApplicationController

  def show
    @room = Room.finder(current_user.id, params[:id])
    @messages = Message.find_by_room_id(@room.id)
    respond_to do |format|
      format.turbo_stream { render partial: 'rooms/chat', locals: {messages: @messages}}
    end
  end

end
