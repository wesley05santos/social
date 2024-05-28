import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "preview" ]
  connect() {
  }

  fetch_input(event){
    this.previewTarget.textContent = event.target.value
  }
}
