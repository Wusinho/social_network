import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conversation"
export default class extends Controller {
  connect() {
    console.log('conversation connected')
  }
  active(event){
    const id = event.target.dataset.id
    fetch(`/rooms/${id}`,{
      method: 'Get',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(r=>r.text())
      .then(Turbo.renderStreamMessage)
  }
}
