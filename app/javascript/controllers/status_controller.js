import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {
  static targets = ['status']
  connect() {
    console.log(this.data.get('friendid'))
  }
}
