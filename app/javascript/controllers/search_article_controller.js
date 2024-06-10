import { Controller } from "@hotwired/stimulus"
import { useDebounce } from 'stimulus-use'


export default class extends Controller {
  static debounces = ['fetch_input']

  connect() {
    useDebounce(this, { wait: 750 })
  }

  fetch_input() {
    const value = this.element.value

    fetch(`http://localhost:3000/search_article?query=${value}`)
    .then((response) => response.json())
    .then((data) => {
      console.log(data)
      const list = document.getElementById('all_articles');
      list.innerHTML = ''
      data.forEach((item)=>{
        const anchor = document.createElement('a');
        const lineBreak = document.createElement('br');
        const span = document.createElement('span');
        anchor.href = `http://localhost:3000/articles/${item.id}`;
        anchor.innerText = item.title
        span.appendChild(anchor);
        span.appendChild(lineBreak);
        list.appendChild(span);
      })
    })
  }
}
