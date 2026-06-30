<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/WEB-INF/includes/nav.jsp" %>

<div class="page-header">
    <h1>Photo Gallery</h1>
    <p>8 stunning views of Kuala Selangor</p>
</div>

<section class="section-padding">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-title">The Beauty of Kuala Selangor</h2>
            <hr class="title-divider mx-auto">
            <p class="section-subtitle">From the magical Sky Mirror to enchanting fireflies — a visual journey</p>
        </div>

        <div class="gallery-grid">

            <!-- Image 1 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/sky-mirror-reflection/600/450"
                     alt="Sky Mirror Reflection at Sasaran">
                <div class="gallery-caption">
                    <i class="fas fa-water me-1"></i> Sky Mirror — Sasaran Beach
                </div>
            </div>

            <!-- Image 2 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/fireflies-selangor-river/600/450"
                     alt="Fireflies along Selangor River">
                <div class="gallery-caption">
                    <i class="fas fa-star me-1"></i> Fireflies — Kampung Kuantan
                </div>
            </div>

            <!-- Image 3 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/bukit-melawati-fort/600/450"
                     alt="Bukit Melawati Historical Fort">
                <div class="gallery-caption">
                    <i class="fas fa-landmark me-1"></i> Bukit Melawati Fort
                </div>
            </div>

            <!-- Image 4 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/bioluminescent-blue-tears/600/450"
                     alt="Blue Tears Bioluminescence at Night">
                <div class="gallery-caption">
                    <i class="fas fa-moon me-1"></i> Blue Tears — Kuala Selangor Beach
                </div>
            </div>

            <!-- Image 5 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/kuala-selangor-seafood/600/450"
                     alt="Fresh Seafood — Kuala Selangor Cuisine">
                <div class="gallery-caption">
                    <i class="fas fa-fish me-1"></i> Famous Chilli Crab Seafood
                </div>
            </div>

            <!-- Image 6 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/kuala-selangor-lighthouse/600/450"
                     alt="Kuala Selangor Lighthouse at Bukit Melawati">
                <div class="gallery-caption">
                    <i class="fas fa-tower-observation me-1"></i> Altingsburg Lighthouse
                </div>
            </div>

            <!-- Image 7 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/mangrove-forest-selangor/600/450"
                     alt="Mangrove Forest along Selangor River">
                <div class="gallery-caption">
                    <i class="fas fa-tree me-1"></i> Mangrove Forest — Selangor River
                </div>
            </div>

            <!-- Image 8 -->
            <div class="gallery-item">
                <img src="https://picsum.photos/seed/kuala-selangor-fishing-village/600/450"
                     alt="Traditional Fishing Village Pasir Penambang">
                <div class="gallery-caption">
                    <i class="fas fa-anchor me-1"></i> Pasir Penambang Fishing Village
                </div>
            </div>

        </div>

        <!-- Google Maps Link -->
        <div class="text-center mt-5">
            <p class="text-muted mb-3">Want to explore these spots yourself?</p>
            <a href="https://maps.app.goo.gl/1dABwi35VsLAE8EU9" target="_blank" class="maps-link-btn">
                <i class="fab fa-google me-2"></i>View Kuala Selangor on Google Maps
            </a>
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
