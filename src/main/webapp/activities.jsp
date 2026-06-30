<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Activities — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/WEB-INF/includes/nav.jsp" %>

<div class="page-header">
    <h1>Things To Do</h1>
    <p>4 unforgettable experiences in Kuala Selangor</p>
</div>

<section class="section-padding">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-title">Top Activities</h2>
            <hr class="title-divider mx-auto">
            <p class="section-subtitle">From natural wonders to cultural heritage — there's something for everyone</p>
        </div>

        <div class="row g-4">

            <!-- Activity 1: Sky Mirror -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/sky-mirror-activity/700/400"
                         alt="Sky Mirror Experience">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-water me-1"></i>Natural Wonder</div>
                        <h4 class="card-title">Sky Mirror Experience</h4>
                        <p class="card-text">
                            Visit the famous Sasaran sandbar — one of Malaysia's most jaw-dropping
                            natural spectacles. During low tide, a vast stretch of flat sand emerges
                            from the sea and creates a perfect mirror reflection of the sky, clouds,
                            and horizon. Reachable by a short boat ride from Pasir Penambang jetty,
                            the Sky Mirror is available twice a month and is an absolute must-visit
                            for photographers and nature lovers alike.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-clock me-1"></i>2–3 hours</span>
                            <span class="text-muted small"><i class="fas fa-users me-1"></i>All ages</span>
                            <span class="text-muted small"><i class="fas fa-calendar me-1"></i>Twice monthly</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Activity 2: Fireflies River Cruise -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/fireflies-river-cruise/700/400"
                         alt="Fireflies River Cruise">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-star me-1"></i>Night Experience</div>
                        <h4 class="card-title">Fireflies River Cruise</h4>
                        <p class="card-text">
                            Embark on a magical boat ride along the Selangor River after dark to witness
                            thousands of synchronised fireflies (Pteroptyx tener) glowing in perfect
                            unison along the mangrove trees. Kampung Kuantan is home to one of the
                            largest and most accessible firefly habitats in the world. The mesmerising
                            natural light show is best enjoyed on a moonless night from September
                            to February.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-clock me-1"></i>1–1.5 hours</span>
                            <span class="text-muted small"><i class="fas fa-moon me-1"></i>Night only</span>
                            <span class="text-muted small"><i class="fas fa-users me-1"></i>Families welcome</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Activity 3: Bukit Melawati Heritage Walk -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/bukit-melawati-heritage/700/400"
                         alt="Bukit Melawati Heritage Walk">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-landmark me-1"></i>History & Culture</div>
                        <h4 class="card-title">Bukit Melawati Heritage Walk</h4>
                        <p class="card-text">
                            Explore the hilltop of Bukit Melawati, the original seat of the Selangor
                            Sultanate. Visit the Altingsburg Lighthouse, the historic Dutch fort ruins,
                            and the Kuala Selangor Nature Park. Along the way, you'll encounter friendly
                            silver leaf monkeys (Presbytis cristata) that roam freely. The hilltop
                            offers panoramic views of the Straits of Malacca and the surrounding
                            river estuary.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-clock me-1"></i>2–4 hours</span>
                            <span class="text-muted small"><i class="fas fa-sun me-1"></i>Daytime</span>
                            <span class="text-muted small"><i class="fas fa-ticket me-1"></i>Free entry</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Activity 4: Seafood Dining -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/kuala-selangor-crab-seafood/700/400"
                         alt="Seafood Dining Experience">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-fish me-1"></i>Food & Dining</div>
                        <h4 class="card-title">Seafood Dining Experience</h4>
                        <p class="card-text">
                            No visit to Kuala Selangor is complete without indulging in the legendary
                            fresh seafood. Head to Pasir Penambang or the town waterfront where dozens
                            of Chinese seafood restaurants serve freshly caught mud crab, prawns, and
                            fish. The signature dish is chilli crab — meaty and flavourful, cooked in
                            a rich, tangy sauce. Dining here at sunset with views of the river estuary
                            is an experience unlike any other.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-clock me-1"></i>1–2 hours</span>
                            <span class="text-muted small"><i class="fas fa-utensils me-1"></i>Lunch &amp; Dinner</span>
                            <span class="text-muted small"><i class="fas fa-dollar-sign me-1"></i>RM 30–80 per pax</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="text-center mt-5">
            <a href="https://maps.app.goo.gl/1dABwi35VsLAE8EU9" target="_blank" class="maps-link-btn me-3">
                <i class="fab fa-google me-1"></i>Find Activities on Maps
            </a>
            <a href="${pageContext.request.contextPath}/contact.jsp" class="btn-primary-custom btn">
                Enquire Now
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
