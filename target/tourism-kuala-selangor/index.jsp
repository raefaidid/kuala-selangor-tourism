<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kuala Selangor Tourism — Discover the Hidden Gem of Selangor</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/WEB-INF/includes/nav.jsp" %>

<!-- ===== HERO ===== -->
<section class="hero">
    <div class="hero-overlay"></div>

    <div class="hero-content">
        <div class="hero-badge"><i class="fas fa-map-marker-alt"></i> Selangor, Malaysia</div>
        <h1>Discover Kuala Selangor</h1>
        <p>Where the sky meets the sea. A tranquil coastal town famous for the magical Sky Mirror,
           enchanting fireflies, and rich Malay heritage.</p>
        <a href="${pageContext.request.contextPath}/gallery.jsp" class="btn btn-accent me-3">Explore Gallery</a>
        <a href="${pageContext.request.contextPath}/contact.jsp" class="btn btn-outline-light">Plan Your Visit</a>
    </div>

    <%-- Visit Malaysia 2026 Sun Bear Mascot --%>
    <img src="${pageContext.request.contextPath}/images/vm2026/sunbear-male.png"
         alt="Mao — Visit Malaysia 2026 Sun Bear Mascot"
         class="hero-mascot">
</section>

<!-- ===== INFO STRIP ===== -->
<section class="info-strip">
    <div class="container">
        <div class="row g-4 justify-content-center">
            <div class="col-sm-6 col-md-3">
                <div class="info-card">
                    <i class="fas fa-water"></i>
                    <h5>Sky Mirror</h5>
                    <p>A natural tidal flat phenomenon that creates breathtaking mirror reflections</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="info-card">
                    <i class="fas fa-star"></i>
                    <h5>Fireflies</h5>
                    <p>One of the world's best firefly habitats along the Selangor River</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="info-card">
                    <i class="fas fa-landmark"></i>
                    <h5>Bukit Melawati</h5>
                    <p>Historical hilltop fort with silver leaf monkeys and colonial heritage</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="info-card">
                    <i class="fas fa-fish"></i>
                    <h5>Seafood</h5>
                    <p>Fresh local seafood restaurants serving iconic chilli crab and more</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== ABOUT ===== -->
<section class="section-padding">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6">
                <div class="hero-badge text-start">About the Destination</div>
                <h2 class="section-title mt-2">A Hidden Gem on Selangor's Coast</h2>
                <hr class="title-divider ms-0">
                <p class="text-muted mb-3" style="line-height:1.8;">
                    Kuala Selangor is a peaceful coastal town located about 70 km north of Kuala Lumpur.
                    Once the seat of the Selangor Sultanate, it blends rich historical heritage with
                    stunning natural wonders that draw visitors from around the world.
                </p>
                <p class="text-muted mb-4" style="line-height:1.8;">
                    The town is best known for the <strong>Sky Mirror</strong> — a sandbar at Kuala
                    Selangor's Sasaran beach that emerges during low tide, creating a mirror-like
                    surface that reflects the sky in awe-inspiring ways. Come nightfall, witness
                    thousands of synchronised fireflies illuminate the mangroves along the Selangor River.
                </p>
                <a href="${pageContext.request.contextPath}/activities.jsp" class="btn-primary-custom btn">
                    <i class="fas fa-compass me-2"></i>See What To Do
                </a>
            </div>
            <div class="col-lg-6">
                <img src="https://picsum.photos/seed/kuala-selangor-town/700/480"
                     alt="Kuala Selangor Waterfront"
                     class="img-fluid rounded-3 shadow-lg" style="object-fit:cover; max-height:400px; width:100%;">
            </div>
        </div>
    </div>
</section>

<!-- ===== SKY MIRROR HIGHLIGHT ===== -->
<section class="section-padding bg-light-custom">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 order-lg-2">
                <div class="hero-badge">Featured Attraction</div>
                <h2 class="section-title mt-2">The Sky Mirror Experience</h2>
                <hr class="title-divider ms-0">
                <p class="text-muted mb-3" style="line-height:1.8;">
                    Sasaran's Sky Mirror is one of Malaysia's most photogenic natural wonders.
                    Accessible only by boat, this vast sandbar appears twice a month during low tide,
                    producing a perfect mirror reflection of the sky and clouds.
                </p>
                <ul class="list-unstyled mb-4">
                    <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Best visited during early morning for golden reflections</li>
                    <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Accessible via a 15-minute boat ride from Pasir Penambang</li>
                    <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Appears only during specific low-tide windows each month</li>
                    <li class="mb-2"><i class="fas fa-check-circle text-success me-2"></i>Perfect for photography and unforgettable memories</li>
                </ul>
                <a href="https://maps.app.goo.gl/YybGbQhGVnVqTVDp6" target="_blank" class="maps-link-btn">
                    <i class="fab fa-google"></i> Open in Google Maps
                </a>
            </div>
            <div class="col-lg-6 order-lg-1">
                <img src="https://picsum.photos/seed/sky-mirror-sasaran/700/480"
                     alt="Sky Mirror at Kuala Selangor"
                     class="img-fluid rounded-3 shadow-lg" style="object-fit:cover; max-height:400px; width:100%;">
            </div>
        </div>
    </div>
</section>

<!-- ===== QUICK LINKS ===== -->
<section class="section-padding">
    <div class="container text-center">
        <h2 class="section-title">Plan Your Visit</h2>
        <p class="section-subtitle">Everything you need to make your Kuala Selangor trip unforgettable</p>
        <div class="row g-4 justify-content-center">
            <div class="col-sm-6 col-md-3">
                <a href="${pageContext.request.contextPath}/gallery.jsp" class="text-decoration-none">
                    <div class="feature-card p-4 h-100 text-center">
                        <i class="fas fa-images fa-2x text-primary-custom mb-3"></i>
                        <h5 class="fw-bold">Gallery</h5>
                        <p class="text-muted small">8 stunning photos of the destination</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-md-3">
                <a href="${pageContext.request.contextPath}/activities.jsp" class="text-decoration-none">
                    <div class="feature-card p-4 h-100 text-center">
                        <i class="fas fa-hiking fa-2x text-primary-custom mb-3"></i>
                        <h5 class="fw-bold">Activities</h5>
                        <p class="text-muted small">4 top things to do in Kuala Selangor</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-md-3">
                <a href="${pageContext.request.contextPath}/accommodation.jsp" class="text-decoration-none">
                    <div class="feature-card p-4 h-100 text-center">
                        <i class="fas fa-bed fa-2x text-primary-custom mb-3"></i>
                        <h5 class="fw-bold">Accommodation</h5>
                        <p class="text-muted small">4 places to stay for every budget</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-md-3">
                <a href="${pageContext.request.contextPath}/contact.jsp" class="text-decoration-none">
                    <div class="feature-card p-4 h-100 text-center">
                        <i class="fas fa-envelope fa-2x text-primary-custom mb-3"></i>
                        <h5 class="fw-bold">Inquiry</h5>
                        <p class="text-muted small">Get in touch — we're happy to help</p>
                    </div>
                </a>
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
