# 😂 Random Dev Joke Generator

A fun, full-stack **3-tier application** that generates random developer/programming jokes.  
Built using **Node.js (Express)** for the backend, **Nginx + HTML/JS** for the frontend, and **MySQL or AWS RDS** as the database.  
Supports live jokes from JokeAPI or custom dirty developer jokes from DB.

---

## 🧱 Architecture

Frontend (Nginx + HTML/JS)  
        ↓  
Backend (Node.js + Express)  
        ↓  
Database (MySQL container or AWS RDS)

---

## 🔧 Features

- RESTful API to fetch random jokes
- Option to pull jokes from:
  - Local MySQL (preloaded dirty jokes)
  - Live public joke API (JokeAPI)
- Fully containerized with Docker Compose
- Kubernetes-ready microservice structure

---

## 🚀 Local Setup with Docker Compose

### 1. Clone the repo
```bash
git clone https://github.com/yourname/jokes-app.git
cd jokes-app

2. Start the application

docker-compose up --build

3. Access the app

Frontend: http://localhost:8080

Backend API: http://localhost:3000/joke