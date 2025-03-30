<%--
  Created by IntelliJ IDEA.
  User: Dev
  Date: 3/30/2025
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>navbar</title>
  <style>
  <%@include file="assets/css/indx.css"%>
  </style>
</head>



<body>
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
        <li class="nav-item"><a href="<%= request.getContextPath() %>/" class="nav-link"><i class="fas fa-home"></i> Home</a></li>
        <li class="nav-item"><a href="task" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
        <li class="nav-item"><a href="#recent" class="nav-link"><i class="far fa-clock"></i> Recent</a></li>
        <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-project-diagram"></i> Projects</a></li>
        <li class="nav-item"><a href="<%= request.getContextPath() %>/resource" class="nav-link"><i class="fas fa-cogs"></i> Resources</a></li>
        <li class="nav-item">
          <button class="theme-toggle nav-link" id="themeToggle">
            <i class="fas fa-moon"></i>
          </button>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script>
  <%@include file="assets/js/index.js"%>
</script>
</body>
</html>
