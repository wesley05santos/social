import { Controller } from "@hotwired/stimulus"
import { useDebounce } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "preview" ]
  static debounces = [
    {
      name: 'fetch_input',
      wait: 2000
    }
  ]

  connect() {
    useDebounce(this)
  }

  fetch_input(event){
    this.previewTarget.textContent = this.handle_input(event.target.value)
  }

  handle_input(text){
    return text
  }
}
