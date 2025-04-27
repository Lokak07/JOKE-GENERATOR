function getJoke() {
  fetch('/joke')
    .then(response => response.json())
    .then(data => {
      document.getElementById('jokeText').innerText = data.joke;
    })
    .catch(err => {
      document.getElementById('jokeText').innerText = "Failed to fetch joke 😢";
      console.error(err);
    });
}
