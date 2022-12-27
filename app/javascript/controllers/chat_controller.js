import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conversation"
export default class extends Controller {
  connect() {
  }
  active(event) {
    event.preventDefault();
    console.log(event.target)
    const id = event.target.dataset.id
    fetch(`/todos/${id}/chat`, {
      method: 'Get',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
      },
  }).then(r => r.text())
      .then(Turbo.renderStreamMessage)
  }
}
