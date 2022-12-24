import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check"
export default class extends Controller {
  connect() {
    console.log('check controller check')
  }
  active(event){
    const id = event.target.dataset.id
    const csrtToken = document.querySelector('meta[name="csrf-token"]').content
    console.log(id)
    console.log(csrtToken)
    console.log(event.target.checked)
    fetch(`/invitations/${id}/active`, {
      method: 'Post',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrtToken
      },
      body: JSON.stringify({confirmed: event.target.checked})

    }).then(r => console.log(r))
  }
 }
