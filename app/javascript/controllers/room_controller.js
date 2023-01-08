import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room"
export default class extends Controller {
  static targets = ['roomstatus']

  connect() {
    let room_id = this.data.get('roomid')
    console.log(room_id)
  }
}
