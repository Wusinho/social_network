import consumer from "channels/consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const chat_room = document.querySelector('.chat__room')
    const input_msg = document.querySelector('#message_form')
    input_msg.reset();
    let p_element = document.createElement("p")
    p_element.append(`${data.current_user}: ${data.content}`)
    chat_room.append(p_element)

    // Called when there's incoming data on the websocket for this channel
  }
});
