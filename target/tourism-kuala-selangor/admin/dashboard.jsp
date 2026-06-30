<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*, com.uitm.csc584.tourism.model.Db" %>
<%
    // Defence-in-depth check (filter already handles this, but belt-and-suspenders)
    if (session.getAttribute("adminUser") == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        return;
    }
    String adminUser = (String) session.getAttribute("adminUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard — Kuala Selangor Tourism</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body { background-color: #f4f6f9; }
        .top-nav {
            background-color: #1c2833;
            padding: 0.75rem 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .top-nav .brand { color: white; font-size: 1.15rem; font-weight: 700; }
        .top-nav .brand span { color: #e8a020; }
        .top-nav .admin-info { color: rgba(255,255,255,0.8); font-size: 0.9rem; }
        .sidebar {
            background-color: #1c2833;
            min-height: calc(100vh - 54px);
            padding-top: 1.5rem;
        }
        .sidebar a {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: rgba(255,255,255,0.75);
            padding: 0.7rem 1.5rem;
            text-decoration: none;
            font-weight: 500;
            border-left: 3px solid transparent;
            transition: all 0.2s;
        }
        .sidebar a:hover, .sidebar a.active {
            color: white;
            background-color: rgba(255,255,255,0.08);
            border-left-color: #e8a020;
        }
        .sidebar a i { width: 18px; }
        .content-area { padding: 2rem; }
    </style>
</head>
<body>

<!-- Top Navigation -->
<div class="top-nav">
    <div class="brand"><i class="fas fa-umbrella-beach me-2"></i>Kuala <span>Selangor</span> Admin</div>
    <div class="d-flex align-items-center gap-3">
        <span class="admin-info"><i class="fas fa-user-circle me-1"></i>Logged in as <strong><%= adminUser %></strong></span>
        <a href="${pageContext.request.contextPath}/admin/logout"
           class="btn btn-sm btn-outline-light">
            <i class="fas fa-right-from-bracket me-1"></i>Logout
        </a>
    </div>
</div>

<div class="d-flex">
    <!-- Sidebar -->
    <div class="sidebar" style="width: 240px; flex-shrink:0;">
        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="active">
            <i class="fas fa-table-list"></i> Inquiries
        </a>
        <a href="${pageContext.request.contextPath}/index.jsp" target="_blank">
            <i class="fas fa-globe"></i> View Public Site
        </a>
        <a href="${pageContext.request.contextPath}/admin/logout">
            <i class="fas fa-right-from-bracket"></i> Logout
        </a>
    </div>

    <!-- Main Content -->
    <div class="content-area flex-grow-1">

        <!-- Page Title + Stat -->
        <div class="d-flex align-items-center justify-content-between mb-4 flex-wrap gap-3">
            <div>
                <h3 class="fw-bold mb-1" style="color:#1c2833;">Visitor Inquiries</h3>
                <p class="text-muted mb-0">All inquiries submitted via the public contact form</p>
            </div>
        </div>

        <!-- Inquiries Table Card -->
        <div class="admin-card">
            <%
                int totalCount = 0;
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String dbError = null;

                try {
                    conn = Db.getConnection();

                    // Get total count for stat card
                    PreparedStatement countPs = conn.prepareStatement("SELECT COUNT(*) FROM inquiries");
                    ResultSet countRs = countPs.executeQuery();
                    if (countRs.next()) totalCount = countRs.getInt(1);
                    countRs.close();
                    countPs.close();
            %>

            <!-- Stat Card -->
            <div class="stat-card blue mb-4" style="max-width:280px;">
                <i class="fas fa-envelope-open-text"></i>
                <div>
                    <div class="stat-number"><%= totalCount %></div>
                    <div class="stat-label">Total Inquiries Received</div>
                </div>
            </div>

            <table id="inquiriesTable" class="table table-striped table-hover w-100">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>How Heard</th>
                        <th>Message</th>
                        <th>Submitted At</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ps = conn.prepareStatement(
                            "SELECT id, name, contact_number, gender, email, how_heard, message, submitted_at " +
                            "FROM inquiries ORDER BY submitted_at DESC");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            String msgText = rs.getString("message");
                            if (msgText != null && msgText.length() > 80) {
                                msgText = msgText.substring(0, 80) + "...";
                            }
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("contact_number") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("how_heard") %></td>
                        <td style="max-width:200px; word-break:break-word;"><%= msgText %></td>
                        <td><%= rs.getTimestamp("submitted_at") %></td>
                    </tr>
                    <%
                        }
                    } catch (SQLException e) {
                        dbError = e.getMessage();
                    } finally {
                        if (rs   != null) try { rs.close();   } catch (SQLException ignored) {}
                        if (ps   != null) try { ps.close();   } catch (SQLException ignored) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                    }
                    if (dbError != null) {
                    %>
                        <tr><td colspan="8" class="text-danger text-center">
                            Database error: <%= dbError %>
                        </td></tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div><!-- /admin-card -->
    </div><!-- /content-area -->
</div><!-- /d-flex -->

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#inquiriesTable').DataTable({
            order: [[7, 'desc']],
            pageLength: 10,
            lengthMenu: [5, 10, 25, 50],
            language: {
                search: 'Search inquiries:',
                emptyTable: 'No inquiries have been submitted yet.'
            },
            columnDefs: [
                { orderable: false, targets: [6] }
            ]
        });
    });
</script>
</body>
</html>
