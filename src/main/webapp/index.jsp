<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Task Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons (Updated to 6.5.2) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <!-- Custom CSS -->
    <style>
        <%@include file="assets/css/indx.css"%>
    </style>
</head>
<body>

<!-- Navbar -->
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

<!-- Hero Section -->
<section id="home">
    <div class="container-fluid">
        <div class="hero-section">
            <img src="images/homeimge.jpg" alt="Construction professionals working on blueprints" class="hero-image">
            <div class="hero-content">
                <h1>Edifice Experienced Construction Professionals</h1>
                <div class="button-group">
                    <a href="#project" class="btn btn-primary">See Projects</a>
                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#contactUsModal">Contact Us</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Contact Us Modal -->
<div class="modal fade" id="contactUsModal" tabindex="-1" aria-labelledby="contactUsModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contactUsModalLabel">Contact Us</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="contactUsForm" action="<%= request.getContextPath() %>/contact" method="post">
                    <div class="mb-3">
                        <label for="contactName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="contactName" name="name" placeholder="Enter your name" required>
                    </div>
                    <div class="mb-3">
                        <label for="contactEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="contactEmail" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label for="contactSubject" class="form-label">Subject</label>
                        <input type="text" class="form-control" id="contactSubject" name="subject" placeholder="Enter subject" required>
                    </div>
                    <div class="mb-3">
                        <label for="contactMessage" class="form-label">Message</label>
                        <textarea class="form-control" id="contactMessage" name="message" rows="4" placeholder="Enter your message" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="contactUsForm" class="btn btn-primary">Send Message</button>
            </div>
        </div>
    </div>
</div>

<!-- Dashboard Section -->
<section class="dashboard-section">
    <div class="container">
        <h5>
            🏗️ Construction Dashboard
        </h5>
        <div class="row my-4">
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <i class="fas fa-tasks fa-3x text-primary"></i>
                    <h5 class="mt-3">Ongoing Tasks</h5>
                    <p>10 tasks in progress</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <i class="fas fa-calendar-check fa-3x text-success"></i>
                    <h5 class="mt-3">Completed Tasks</h5>
                    <p>8 tasks completed this week</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <i class='fas fa-users' style='font-size:36px'></i>
                    <h5 class="mt-3">Team Members</h5>
                    <p>5 active members</p>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Our Projects Section -->
<section class="projects-section" id="project">
    <div class="container">
        <h5>OUR PROJECTS</h5>
        <div class="row">
            <div class="col-md-4">
                <img src="https://www.aakashgroup.com/wp-content/uploads/2019/07/school-2-1-1000x500.jpg" class="project-img" onclick="openProjectModal('https://www.aakashgroup.com/wp-content/uploads/2019/07/school-2-1-1000x500.jpg', 'School Construction', 'A modern school building constructed with sustainable materials, completed in 2023.')">
            </div>
            <div class="col-md-4">
                <img src="https://c8.alamy.com/comp/BKKABN/according-to-robert-hormes-the-german-architect-from-the-firm-gmp-BKKABN.jpg" class="project-img" onclick="openProjectModal('https://c8.alamy.com/comp/BKKABN/according-to-robert-hormes-the-german-architect-from-the-firm-gmp-BKKABN.jpg', 'Commercial Building', 'A state-of-the-art commercial complex designed for efficiency and aesthetics.')">
            </div>
            <div class="col-md-4">
                <img src="https://livedemo00.template-help.com/wt_prod-19302/images/project-5-1200x800.jpg" class="project-img" onclick="openProjectModal('https://livedemo00.template-help.com/wt_prod-19302/images/project-5-1200x800.jpg', 'Modern House', 'A luxurious modern house with eco-friendly features, completed in 2022.')">
            </div>
            <div class="col-md-4">
                <img src="https://livedemo00.template-help.com/wt_prod-19302/images/project-4-1200x800.jpg" class="project-img" onclick="openProjectModal('https://livedemo00.template-help.com/wt_prod-19302/images/project-4-1200x800.jpg', 'Apartment Complex', 'A multi-story apartment complex offering modern living spaces.')">
            </div>
            <div class="col-md-4">
                <img src="https://livedemo00.template-help.com/wt_prod-19302/images/project-6-1200x800.jpg" class="project-img" onclick="openProjectModal('https://livedemo00.template-help.com/wt_prod-19302/images/project-6-1200x800.jpg', 'Industrial Facility', 'A large-scale industrial facility built for heavy-duty operations.')">
            </div>
            <div class="col-md-4">
                <img src="https://media.licdn.com/dms/image/v2/D4D12AQF5CCwtwkNHEg/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1695451944444?e=2147483647&v=beta&t=00swPR4zmpD7oVPT8tVvflfICF2AcUIu0uwDesCLmaw" class="project-img" onclick="openProjectModal('https://media.licdn.com/dms/image/v2/D4D12AQF5CCwtwkNHEg/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1695451944444?e=2147483647&v=beta&t=00swPR4zmpD7oVPT8tVvflfICF2AcUIu0uwDesCLmaw', 'Construction Site', 'An ongoing construction site for a major urban development project.')">
            </div>
        </div>
    </div>
</section>

<!-- Project Modal -->
<div class="project-modal" id="projectModal">
    <div class="project-modal-content" id="projectModalContent">
        <span class="close-btn" onclick="closeProjectModal()">&times;</span>
        <h3 id="projectTitle"></h3>
        <p id="projectDescription"></p>
    </div>
</div>

<!-- Recent News Section -->
<section class="news-section"  id="recent">
    <div class="container">
        <h5>RECENT NEWS</h5>
        <div class="row">
            <div class="col-md-4">
                <div class="news-card">
                    <div class="news-content">
                        <h6>667 CONGRESS STREET PROJECT IS FINISHED!</h6>
                        <div class="meta">Jan 20, 2018 by Brian Williamson</div>
                        <p>Today we commemorated the completion of steel erection at the 667 Congress Street Apartments project with a traditional topping out. Despite the dreary weather, spirits were high in Portland, Maine, as...</p>
                    </div>
                    <img src="https://finance-commerce.com/files/2017/05/School-Construction-Stillwater6.jpg" alt="News 1">
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-card">
                    <div class="news-content">
                        <h6>RIBBON "CUT" TO OPEN NEW BUS CENTER</h6>
                        <div class="meta">Jan 20, 2018 by Brian Williamson</div>
                        <p>Yesterday was a big day for the City of Burlington as a Green Mountain Transit bus literally drove through the ribbon to officially open the new Downtown Transit Center in Vermont. We have finally...</p>
                    </div>
                    <img src="https://cdn.ca.emap.com/wp-content/uploads/sites/8/2018/10/Sutton-Passivhaus-school-1024x683.jpg" alt="News 2">
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-card">
                    <div class="news-content">
                        <h6>NEW DOUBLED RESIDENCE FACILITY</h6>
                        <div class="meta">Jan 20, 2018 by Brian Williamson</div>
                        <p>Last month, our construction company turned over the 110,000-square-foot, 237-bed Fox Run at Fulton housing facility for occupancy. Located adjacent to Marist College, the facility is now home to 237...</p>
                    </div>
                    <img src="https://arquitectonica.com/architecture/wp-content/uploads/sites/2/2018/07/High_School_for_Construction_Trades_Engineering_Architecture_QueensNY_1_ft-1920x1080.jpg" alt="News 3">
                </div>
            </div>
        </div>
        <div class="carousel-indicators">
            <span class="active"></span>
            <span></span>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <!-- Company Info -->
        <div class="footer-section">
            <h5>ConstructionXpert</h5>
            <p>We are a leading construction company dedicated to delivering exceptional projects with precision and quality.</p>
        </div>

        <!-- Quick Links -->
        <div class="footer-section">
            <h5>Quick Links</h5>
            <ul>
                <li><a href="<%= request.getContextPath() %>/project">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/task?action=listTasks&project_id=">Tasks</a></li>
                <li><a href="#recent">Recent</a></li>
                <li><a href="<%= request.getContextPath() %>/project">Projects</a></li>
                <li><a href="listressource.jsp">Resources</a></li>
            </ul>
        </div>

        <!-- Contact Info -->
        <div class="footer-section">
            <h5>Contact Us</h5>
            <p><i class="fas fa-map-marker-alt me-2"></i> 123 Construction Ave, Build City, 12345</p>
            <p><i class="fas fa-phone me-2"></i> +212 55 123-4567</p>
            <p><i class="fas fa-envelope me-2"></i> info@constructionxpert.com</p>
        </div>

        <!-- Social Media -->
        <div class="footer-section">
            <h5>Follow Us</h5>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2025 ConstructionXpert. All Rights Reserved.</p>
    </div>
</footer>
<script>
    <%@include file="assets/js/index.js"%>
</script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>