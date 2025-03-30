<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page de Connexion - SolarBuild</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Custom CSS from index.jsp -->
  <style>
    <%@include file="assets/css/indx.css"%>
    .login-container {
      max-width: 400px;
      margin: 0 auto;
      padding: 2rem;
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      position: relative;
      z-index: 2;
    }
    body.dark-mode .login-container {
      background-color: #2a3439;
      color: #e0e0e0;
    }
    .login-container h2 {
      text-align: center;
      margin-bottom: 2rem;
      color: #333;
      font-weight: bold;
    }
    body.dark-mode .login-container h2 {
      color: #ffd107;
    }
    .input-group {
      position: relative;
      margin-bottom: 1.5rem;
    }
    .input-group i {
      position: absolute;
      top: 50%;
      left: 10px;
      transform: translateY(-50%);
      color: #666;
    }
    body.dark-mode .input-group i {
      color: #aaa;
    }
    .input-group input {
      width: 100%;
      padding: 0.75rem 0.75rem 0.75rem 2.5rem;
      border-radius: 8px;
      border: 1px solid #ddd;
      background-color: #fff;
      color: #333;
    }
    body.dark-mode .input-group input {
      background-color: #3a3a3a;
      color: #e0e0e0;
      border-color: #555;
    }
    .input-group input:focus {
      border-color: #ffc107;
      box-shadow: 0 0 0 0.25rem rgba(255, 193, 7, 0.25);
      outline: none;
    }
    .checkbox-group {
      display: flex;
      align-items: center;
      margin-bottom: 1.5rem;
    }
    .checkbox-group label {
      margin-left: 0.5rem;
      color: #333;
    }
    body.dark-mode .checkbox-group label {
      color: #e0e0e0;
    }
    .login-container button {
      width: 100%;
      padding: 0.75rem;
      background-color: #ffc107;
      color: #333;
      border: none;
      border-radius: 8px;
      font-weight: bold;
      transition: all 0.3s ease;
    }
    body.dark-mode .login-container button {
      background-color: #d4a017;
      color: #fff;
    }
    .login-container button:hover {
      background-color: #ffca28;
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    body.dark-mode .login-container button:hover {
      background-color: #b58b14;
    }
    .error-message {
      color: #dc3545;
      text-align: center;
      margin-bottom: 1rem;
    }
    body.dark-mode .error-message {
      color: #ff6b6b;
    }
    .login-title {
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      margin-bottom: 2rem;
      color: #333;
      font-weight: bold;
      font-size: 1.75rem; /* Slightly larger for emphasis */
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
      transition: all 0.3s ease; /* Smooth transition for dark mode */
    }

    body.dark-mode .login-title {
      color: #ffd107; /* Matches navbar branding in dark mode */
    }

    /* Icon Styling */
    .login-title i {
      font-size: 1.5rem; /* Slightly larger icon */
      color: #f5c518; /* Matches your primary button color */
      transition: transform 0.3s ease; /* Smooth animation */
    }

    body.dark-mode .login-title i {
      color: #d4a017; /* Dark mode variant of the primary color */
    }

    .login-title:hover i {
      transform: rotate(15deg); /* Subtle hover animation for interactivity */
    }
  </style>
</head>
<body>
<!-- Navbar (Copied from index.jsp) -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="display: flex; align-items: center;">
      <div style="display: flex; margin-right: 10px;">
        <div style="width: 8px; height: 16px; background: rgb(11,14,33); margin-right: 4px;"></div>
        <div style="width: 8px; height: 12px; background: #090808; margin-right: 4px; align-self: flex-end;"></div>
        <div style="width: 8px; height: 20px; background: #090808;"></div>
      </div>
      <span style="font-weight: 700; letter-spacing: 0.5px;">CONSTRUCTION<span style="color: #ffffff;">XPERT</span></span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <button class="theme-toggle nav-link" id="themeToggle">
            <i class="fas fa-moon"></i>
          </button>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Login Form -->
<section style="min-height: 100vh; display: flex; align-items: center; background-image: url('images/sketch-new-construction.jpg'); background-size: cover; background-position: center; position: relative;">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 1;"></div>
  <div class="login-container">
    <h2 class="login-title">
      <i class="fas fa-hard-hat" style="margin-right: 0.5rem;"></i> SolarStruct
    </h2>
    <% if (request.getAttribute("error") != null) { %>
    <div class="error-message"><%= request.getAttribute("error") %></div>
    <% } %>
    <form action="seConnecter" method="post">
      <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input type="email" name="username" placeholder="Email" required>
      </div>
      <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" placeholder="Mot de passe" required>
      </div>
      <div class="checkbox-group">
        <input type="checkbox" name="remember" id="remember">
        <label for="remember">Remember me</label>
      </div>
      <button type="submit">Login</button>
    </form>
  </div>
</section>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Theme Toggle Logic (Copied from index.js)
  const themeToggle = document.getElementById('themeToggle');
  const body = document.body;

  themeToggle.addEventListener('click', () => {
    body.classList.toggle('dark-mode');
    if (body.classList.contains('dark-mode')) {
      themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
    } else {
      themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
    }
  });
</script>
</body>
</html>