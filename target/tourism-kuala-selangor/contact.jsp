<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact & Inquiry — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/WEB-INF/includes/nav.jsp" %>

<div class="page-header">
    <h1>Contact Us</h1>
    <p>Send us an inquiry — we're happy to help plan your visit</p>
</div>

<section class="section-padding contact-section">
    <div class="container">
        <div class="row g-5 align-items-start justify-content-center">

            <!-- Sidebar Info -->
            <div class="col-lg-4">
                <div class="mb-4">
                    <h4 class="fw-bold text-primary-custom mb-3">Get In Touch</h4>
                    <p class="text-muted" style="line-height:1.8;">
                        Have questions about visiting Kuala Selangor or the Sky Mirror? Send us
                        an inquiry and our team will get back to you as soon as possible.
                    </p>
                </div>
                <ul class="list-unstyled">
                    <li class="d-flex gap-3 mb-3">
                        <div style="min-width:36px; height:36px; background:var(--primary); border-radius:50%; display:flex; align-items:center; justify-content:center;">
                            <i class="fas fa-map-marker-alt text-white" style="font-size:0.85rem;"></i>
                        </div>
                        <div>
                            <p class="fw-semibold mb-0">Location</p>
                            <p class="text-muted small mb-0">Kuala Selangor, Selangor, Malaysia</p>
                        </div>
                    </li>
                    <li class="d-flex gap-3 mb-3">
                        <div style="min-width:36px; height:36px; background:var(--primary); border-radius:50%; display:flex; align-items:center; justify-content:center;">
                            <i class="fas fa-envelope text-white" style="font-size:0.85rem;"></i>
                        </div>
                        <div>
                            <p class="fw-semibold mb-0">Email</p>
                            <p class="text-muted small mb-0">info@kuala-selangor-tourism.com</p>
                        </div>
                    </li>
                    <li class="d-flex gap-3 mb-3">
                        <div style="min-width:36px; height:36px; background:var(--primary); border-radius:50%; display:flex; align-items:center; justify-content:center;">
                            <i class="fas fa-phone text-white" style="font-size:0.85rem;"></i>
                        </div>
                        <div>
                            <p class="fw-semibold mb-0">Phone</p>
                            <p class="text-muted small mb-0">+60 3-3289 0000</p>
                        </div>
                    </li>
                </ul>
                <div class="mt-4">
                    <a href="https://maps.app.goo.gl/1dABwi35VsLAE8EU9" target="_blank" class="maps-link-btn w-100 justify-content-center">
                        <i class="fab fa-google"></i> Open in Google Maps
                    </a>
                </div>
            </div>

            <!-- Inquiry Form -->
            <div class="col-lg-7">
                <div class="inquiry-form-card">
                    <h4 class="fw-bold text-primary-custom mb-4">
                        <i class="fas fa-paper-plane me-2"></i>Visitor Inquiry Form
                    </h4>

                    <%-- Success/Error Feedback --%>
                    <% if (request.getAttribute("success") != null) { %>
                        <div class="alert-success-custom">
                            <i class="fas fa-check-circle me-2"></i><%= request.getAttribute("success") %>
                        </div>
                    <% } %>
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert-error-custom">
                            <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <form id="inquiryForm" action="${pageContext.request.contextPath}/submit-inquiry"
                          method="post" novalidate onsubmit="return validateForm()">

                        <div class="row g-3">
                            <!-- Name -->
                            <div class="col-md-6">
                                <label for="name" class="form-label">Full Name <span class="text-danger">*</span></label>
                                <input type="text" id="name" name="name" class="form-control"
                                       placeholder="e.g. Ahmad Bin Ali" required
                                       value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                            </div>

                            <!-- Contact Number -->
                            <div class="col-md-6">
                                <label for="contactNumber" class="form-label">Contact Number <span class="text-danger">*</span></label>
                                <input type="tel" id="contactNumber" name="contactNumber" class="form-control"
                                       placeholder="e.g. 012-3456789" required
                                       value="<%= request.getParameter("contactNumber") != null ? request.getParameter("contactNumber") : "" %>">
                            </div>

                            <!-- Gender -->
                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender <span class="text-danger">*</span></label>
                                <select id="gender" name="gender" class="form-select" required>
                                    <option value="" disabled
                                        <%= (request.getParameter("gender") == null) ? "selected" : "" %>>
                                        Select gender
                                    </option>
                                    <option value="Male"
                                        <%= "Male".equals(request.getParameter("gender")) ? "selected" : "" %>>Male</option>
                                    <option value="Female"
                                        <%= "Female".equals(request.getParameter("gender")) ? "selected" : "" %>>Female</option>
                                    <option value="Prefer not to say"
                                        <%= "Prefer not to say".equals(request.getParameter("gender")) ? "selected" : "" %>>Prefer not to say</option>
                                </select>
                            </div>

                            <!-- Email -->
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                                <input type="email" id="email" name="email" class="form-control"
                                       placeholder="e.g. ahmad@email.com" required
                                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                            </div>

                            <!-- How did you know about us -->
                            <div class="col-12">
                                <label for="howHeard" class="form-label">How did you know about us? <span class="text-danger">*</span></label>
                                <select id="howHeard" name="howHeard" class="form-select" required>
                                    <option value="" disabled
                                        <%= (request.getParameter("howHeard") == null) ? "selected" : "" %>>
                                        Please select an option
                                    </option>
                                    <option value="Social Media"
                                        <%= "Social Media".equals(request.getParameter("howHeard")) ? "selected" : "" %>>Social Media</option>
                                    <option value="Search Engine"
                                        <%= "Search Engine".equals(request.getParameter("howHeard")) ? "selected" : "" %>>Search Engine (Google, Bing, etc.)</option>
                                    <option value="Friends or Family"
                                        <%= "Friends or Family".equals(request.getParameter("howHeard")) ? "selected" : "" %>>Friends or Family</option>
                                    <option value="Travel Magazine"
                                        <%= "Travel Magazine".equals(request.getParameter("howHeard")) ? "selected" : "" %>>Travel Magazine / Blog</option>
                                    <option value="Television or Radio"
                                        <%= "Television or Radio".equals(request.getParameter("howHeard")) ? "selected" : "" %>>Television or Radio</option>
                                    <option value="Other"
                                        <%= "Other".equals(request.getParameter("howHeard")) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>

                            <!-- Message -->
                            <div class="col-12">
                                <label for="message" class="form-label">Message <span class="text-danger">*</span></label>
                                <textarea id="message" name="message" class="form-control"
                                          rows="4" placeholder="Tell us what you'd like to know..." required><%= request.getParameter("message") != null ? request.getParameter("message") : "" %></textarea>
                            </div>
                        </div>

                        <div class="d-flex gap-3 mt-4">
                            <button type="submit" class="btn-primary-custom btn">
                                <i class="fas fa-paper-plane me-2"></i>Submit Inquiry
                            </button>
                            <button type="reset" id="clearBtn" class="btn-secondary-custom btn">
                                <i class="fas fa-times me-2"></i>Clear
                            </button>
                        </div>
                    </form>
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
<script>
    function validateForm() {
        const fields = ['name', 'contactNumber', 'gender', 'email', 'howHeard', 'message'];
        for (const id of fields) {
            const el = document.getElementById(id);
            if (!el.value || el.value.trim() === '') {
                el.classList.add('is-invalid');
                el.focus();
                alert('Please fill in all required fields before submitting.');
                return false;
            } else {
                el.classList.remove('is-invalid');
            }
        }
        return true;
    }

    // Clear invalid state on input
    document.querySelectorAll('.form-control, .form-select').forEach(el => {
        el.addEventListener('input', () => el.classList.remove('is-invalid'));
        el.addEventListener('change', () => el.classList.remove('is-invalid'));
    });
</script>
</body>
</html>
