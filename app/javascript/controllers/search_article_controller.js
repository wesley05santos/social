import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // connect() {
  // }

  fetch_input(event) {
    const value = this.element.value

    fetch(`http://localhost:3000/search_article?query=${value}`)
    .then((response) => response.json())
    .then((data) => {
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

      // debugger
    })
  }
}
