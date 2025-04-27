const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const axios = require('axios');

const app = express();
app.use(cors());

// (You can remove this if you're only using external API)
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DATABASE
});


// API route to get joke from JokeAPI
app.get('/joke', async (req, res) => {
  try {
    const { data } = await axios.get('https://v2.jokeapi.dev/joke/Programming?type=single');
    res.json({ joke: data.joke });
  } catch (err) {
    res.status(500).json({ error: 'Could not fetch joke 😭' });
  }
});


// Server listening
app.listen(3000, () => {
  console.log('Backend running on http://localhost:3000');
});
