import { Controller } from "@hotwired/stimulus"
//import { useDebounce } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "preview" ]
  //static debounces = [
  //  {
  //    name: 'fetch_input',
  //    wait: 2000
  //  }
  //]

  connect() {
    //useDebounce(this)
  }

  fetch_input(event){
    this.previewTarget.textContent = this.handle_input(event.target.value)
  }

  handle_input(text){
    if(text.length >= 3){ text = this.inject_char(3, '.', text) }
    if(text.length >= 7){ text = this.inject_char(7, '.', text) }
    if(text.length >= 11){ text = this.inject_char(11, '-', text) }
    return text
  }
  inject_char(position, char, text){
    var textTmp = text.split('')
    textTmp.splice(position,0, char)
    return textTmp.join('')
  }
}
