import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-status"
export default class extends Controller {
  static targets = ['userstatus']

  connect() {
    console.log(this.data.get('userdid'))
  }
}
