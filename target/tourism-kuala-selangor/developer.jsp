<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/WEB-INF/includes/nav.jsp" %>

<div class="page-header">
    <h1>Developer</h1>
    <p>About the developer behind this project</p>
</div>

<section class="section-padding bg-light-custom">
    <div class="container">
        <div class="developer-card">

            <!-- Coloured Header Band -->
            <div class="developer-header"></div>

            <!-- Photo overlapping the header -->
            <div class="text-center" style="margin-top: -70px; position:relative; z-index:2;">
                <%--
                    PLACEHOLDER — replace src with your own photo.
                    Place your photo in: src/main/webapp/images/developer.jpg
                    Then change src to: ${pageContext.request.contextPath}/images/developer.jpg
                --%>
                <img src="./images/raef.png"
                     alt="Developer Photo"
                     class="developer-photo">
            </div>

            <div class="developer-body">
                <%-- ====================================================
                     PLACEHOLDER — Fill in your actual details below
                     ==================================================== --%>
                <h2 class="developer-name">Raef Luqman Bin Mohammad Aidid</h2>
                <p class="developer-id">Student ID: 2022673128</p>

                <hr style="max-width:300px; margin:0 auto 1.5rem;">

                <ul class="contact-list">
                    <li>
                        <i class="fas fa-id-badge"></i>
                        <span><strong>Programme:</strong> CDCS230 Bachelor of Computer Science (Hons.)</span>
                    </li>
                    <li>
                        <i class="fas fa-university"></i>
                        <span><strong>Institution:</strong> Universiti Teknologi MARA (UiTM)</span>
                    </li>
                    <li>
                        <i class="fas fa-envelope"></i>
                        <span><strong>Email:</strong> <a href="mailto:2022673128@student.uitm.edu.my">2022673128@student.uitm.edu.my</a></span>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i>
                        <span><strong>Phone:</strong> +60 10-936 4867</span>
                    </li>
                    <li>
                        <i class="fas fa-calendar-alt"></i>
                        <span><strong>Semester:</strong> March 2026 &ndash; August 2026</span>
                    </li>
                    <li>
                        <i class="fas fa-laptop-code"></i>
                        <span><strong>Assignment:</strong> Individual Assignment &mdash; Web Front-End Development (20%)</span>
                    </li>
                </ul>

                <div class="mt-4 p-3 rounded-3" style="background:var(--light-bg);">
                    <h6 class="fw-bold text-primary-custom mb-2">Tech Stack Used</h6>
                    <div class="d-flex flex-wrap gap-2 justify-content-center">
                        <span class="badge" style="background:var(--primary); font-size:0.85rem; padding:0.4rem 0.8rem;">JSP</span>
                        <span class="badge" style="background:var(--primary); font-size:0.85rem; padding:0.4rem 0.8rem;">Java Servlets</span>
                        <span class="badge" style="background:var(--primary); font-size:0.85rem; padding:0.4rem 0.8rem;">JDBC</span>
                        <span class="badge" style="background:var(--primary); font-size:0.85rem; padding:0.4rem 0.8rem;">PostgreSQL</span>
                        <span class="badge" style="background:var(--primary); font-size:0.85rem; padding:0.4rem 0.8rem;">jQuery DataTables</span>
                        <span class="badge" style="background:var(--secondary); font-size:0.85rem; padding:0.4rem 0.8rem;">Bootstrap 5</span>
                        <span class="badge" style="background:var(--secondary); font-size:0.85rem; padding:0.4rem 0.8rem;">Apache Maven</span>
                        <span class="badge" style="background:var(--secondary); font-size:0.85rem; padding:0.4rem 0.8rem;">Jetty</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="footer-stripe"></div>
    <div class="footer-body">
        <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between gap-2">
            <img src="${pageContext.request.contextPath}/images/vm2026/logo.png"
                 alt="Visit Malaysia 2026" style="height:36px; opacity:0.85;">
            <p class="mb-0">&copy; 2026 Kuala Selangor Tourism &mdash; CSC584 Individual Assignment</p>
            <a href="${pageContext.request.contextPath}/developer.jsp">Developer Info</a>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
