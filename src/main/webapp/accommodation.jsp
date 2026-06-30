<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accommodation — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/WEB-INF/includes/nav.jsp" %>

<div class="page-header">
    <h1>Where To Stay</h1>
    <p>4 comfortable options for every type of traveller</p>
</div>

<section class="section-padding">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-title">Accommodation in Kuala Selangor</h2>
            <hr class="title-divider mx-auto">
            <p class="section-subtitle">From riverside resorts to budget homestays — rest well after a day of adventure</p>
        </div>

        <div class="row g-4">

            <!-- Accommodation 1 -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/firefly-park-resort/700/400"
                         alt="Firefly Park Resort">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-star me-1"></i>4-Star Resort</div>
                        <h4 class="card-title">Firefly Park Resort</h4>
                        <p class="card-text">
                            Nestled along the banks of the Selangor River, Firefly Park Resort is the
                            premier accommodation choice in Kuala Selangor. Chalets and garden rooms
                            are set amidst lush greenery with direct access to the firefly boat cruise.
                            Amenities include a swimming pool, restaurant, and guided nature tours.
                            Perfect for families and couples seeking a nature retreat.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-tag me-1"></i>From RM 180/night</span>
                            <span class="text-muted small"><i class="fas fa-wifi me-1"></i>Free WiFi</span>
                            <span class="text-muted small"><i class="fas fa-swimming-pool me-1"></i>Pool</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Accommodation 2 -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/de-palma-hotel/700/400"
                         alt="De Palma Hotel Kuala Selangor">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-hotel me-1"></i>3-Star Hotel</div>
                        <h4 class="card-title">De Palma Hotel</h4>
                        <p class="card-text">
                            A comfortable and well-appointed hotel located in the heart of Kuala
                            Selangor town. De Palma Hotel offers spacious rooms, a halal restaurant
                            serving local and international cuisine, a function hall, and meeting
                            facilities. Conveniently located near Bukit Melawati and the town centre,
                            it is ideal for both leisure and business travellers.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-tag me-1"></i>From RM 120/night</span>
                            <span class="text-muted small"><i class="fas fa-wifi me-1"></i>Free WiFi</span>
                            <span class="text-muted small"><i class="fas fa-utensils me-1"></i>Restaurant</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Accommodation 3 -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/kampung-kuantan-homestay/700/400"
                         alt="Kampung Kuantan Riverside Homestay">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-home me-1"></i>Homestay</div>
                        <h4 class="card-title">Kampung Kuantan Riverside Homestay</h4>
                        <p class="card-text">
                            Experience authentic Malay village hospitality at this traditional riverside
                            homestay in Kampung Kuantan — ground zero for the firefly experience.
                            Wake up to the gentle sound of the Selangor River, enjoy home-cooked local
                            meals, and step directly onto a boat for your evening firefly cruise.
                            An affordable and immersive way to connect with local culture.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-tag me-1"></i>From RM 70/night</span>
                            <span class="text-muted small"><i class="fas fa-utensils me-1"></i>Meals included</span>
                            <span class="text-muted small"><i class="fas fa-leaf me-1"></i>Eco-friendly</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Accommodation 4 -->
            <div class="col-md-6">
                <div class="feature-card">
                    <img src="https://picsum.photos/seed/bukit-melawati-chalet/700/400"
                         alt="Bukit Melawati Chalet">
                    <div class="card-body">
                        <div class="card-badge"><i class="fas fa-mountain me-1"></i>Hillside Chalet</div>
                        <h4 class="card-title">Bukit Melawati Chalet</h4>
                        <p class="card-text">
                            Perched on the slopes of Bukit Melawati, these charming wooden chalets
                            offer sweeping views of the Straits of Malacca and the Selangor River
                            estuary. The property is surrounded by nature park greenery and is home
                            to the resident silver leaf monkey population. Enjoy cool hilltop breezes,
                            a quiet atmosphere, and easy access to all of Bukit Melawati's heritage
                            attractions.
                        </p>
                        <div class="mt-3 d-flex gap-3 flex-wrap">
                            <span class="text-muted small"><i class="fas fa-tag me-1"></i>From RM 95/night</span>
                            <span class="text-muted small"><i class="fas fa-mountain me-1"></i>Hilltop views</span>
                            <span class="text-muted small"><i class="fas fa-paw me-1"></i>Wildlife nearby</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="text-center mt-5">
            <a href="https://maps.app.goo.gl/1dABwi35VsLAE8EU9" target="_blank" class="maps-link-btn me-3">
                <i class="fab fa-google me-1"></i>Find on Google Maps
            </a>
            <a href="${pageContext.request.contextPath}/contact.jsp" class="btn-primary-custom btn">
                Ask About Accommodation
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
