import { Controller } from "@hotwired/stimulus"
import user_status from "../channels/user_status_channel";

// Connects to data-controller="user-status"
export default class extends Controller {
  static targets = ['userstatus']

  connect() {
    let user_id = this.data.get('userdid')
    user_status(user_id, this.userstatusTarget)
  }
}
