import consumer from "channels/consumer"

let user_status = (user_id, user) => consumer.subscriptions.create(
  {
  channel: "UserStatusChannel",
  user_id: user_id,
  },
   {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    user.innerHTML = data.user
  }
});

export default user_status;
