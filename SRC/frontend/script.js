function getJoke() {
  fetch('http://localhost:3000/joke')
    .then(response => response.json())
    .then(data => {
      document.getElementById('jokeText').innerText = data.joke;
    });
}
