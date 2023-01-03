import consumer from "channels/consumer"

const friends_link = document.querySelector('.friend__links');
friends_link.addEventListener('click', (e) => {

  const link = e.target.href
  const numbers = link.match(/\d+/g);
  const room_number = numbers[numbers.length - 1]
  chat_room( room_number)
});
    let chat_room = (room_id) =>  consumer.subscriptions.create(
  { channel: "RoomChannel", room_id: room_id},
  {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const chat_room = document.querySelector('.chat__room');
    const user_id = Number(chat_room.getAttribute('data-user-id'));
    const input_msg = document.querySelector('#message_form');
    input_msg.reset();

    console.log(data)
    let message__div = document.createElement("div");
    message__div.classList.add('message');
    if (user_id === data.author_id) message__div.classList.add('me');

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
  }
});
// });
