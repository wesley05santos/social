import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const back_end_url = 'http://127.0.0.1:8000/api/v1/articles.json'

  useEffect(()=>{
    axios.get(back_end_url)
         .then(response => setArticles(response.data.data))
         .catch(error => console.log(error))
  }, [])

  const [articles, setArticles] = useState([]);
  return (
    <div className="App">
      <h2>Articles:</h2>
      <div>
        {
          articles.map(
            (article, _) => {
              return(
                <div>
                  {article.title} - {article.content}
                </div>
              )
            }
          )
        }
      </div>
    </div>
  );
}

export default App;
