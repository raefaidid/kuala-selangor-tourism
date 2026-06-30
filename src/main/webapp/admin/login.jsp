<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // If already logged in, skip straight to dashboard
    if (session.getAttribute("adminUser") != null) {
        response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="login-wrapper">
    <div class="login-card">

        <div class="login-logo">
            <i class="fas fa-shield-halved"></i>
            <h4>Admin Portal</h4>
            <p>Kuala Selangor Tourism — Staff Access</p>
        </div>

        <%-- Error Message --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert-error-custom">
                <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" id="username" name="username" class="form-control"
                           placeholder="Enter username" required autofocus>
                </div>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" id="password" name="password" class="form-control"
                           placeholder="Enter password" required>
                </div>
            </div>
            <button type="submit" class="btn-primary-custom btn w-100">
                <i class="fas fa-right-to-bracket me-2"></i>Login
            </button>
        </form>

        <p class="text-center mt-3 mb-0">
            <a href="${pageContext.request.contextPath}/index.jsp" class="text-muted small">
                <i class="fas fa-arrow-left me-1"></i>Back to Public Site
            </a>
        </p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
