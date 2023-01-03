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

    let message__div = document.createElement("div")
    message__div.classList.add('message');
    message__div.classList.add('me');
    let content__container = document.createElement('div')
    content__container.classList.add('content-container')

    let tag__content = document.createElement('div')
    tag__content.classList.add('content')

    let content__footer = document.createElement('footer')
    content__footer.classList.add('created');

    let tag__cite = document.createElement('cite')
    tag__cite.append(data.created_at)
    content__footer.append(tag__cite)

    tag__content.append(`${data.current_user}: ${data.content}`)

    content__container.append(tag__content)
    content__container.append(content__footer)
    message__div.append((content__container))
    chat_room.prepend(message__div)
    console.log(message__div)
    // Called when there's incoming data on the websocket for this channel
  }
});
