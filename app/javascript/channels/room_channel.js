import consumer from "channels/consumer"

const friends_link = document.querySelector('.friend__links');
friends_link.addEventListener('click', (e) => {

  const link = e.target.href
  const numbers = link.match(/\d+/g);
  const friend_id = numbers[numbers.length - 1]
  chat_room(friend_id)
});
    let chat_room = (friend_id) =>  consumer.subscriptions.create(
  { channel: "RoomChannel", friend_id: friend_id},
  {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const chat_room = document.querySelector('.chat__room');
    let div = document.createElement('div')
    div.innerHTML = data.message
    chat_room.append(div)
    const input_msg = document.querySelector('#message_form');
    input_msg.reset();
  }
});
// });
