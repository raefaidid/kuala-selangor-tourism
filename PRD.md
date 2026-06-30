# Product Requirements Document
## Kuala Selangor Tourism Web Application
### CSC584 Individual Assignment — Mar 2026–Aug 2026

---

## 1. Overview

This document describes **Version 1.0 (MVP)** of the Kuala Selangor Tourism web application, developed as part of CSC584 (Enterprise Programming) at UiTM. It serves as a living reference for what has been built, the decisions made, and the criteria it must satisfy for full marks.

**Destination:** Kuala Selangor, Selangor, Malaysia — a coastal town ~70 km north of Kuala Lumpur, famous for the Sky Mirror, firefly sanctuaries, Bukit Melawati, and fresh seafood.

**Submission deadline:** Week 13 via UiTM UFUTURE (video + ZIP with SQL file)

**Assignment weight:** 20% of CSC584 final grade

---

## 2. Goals

| # | Goal | Why it matters |
|---|------|----------------|
| G1 | Deliver a polished public-facing tourism website | Contributes to UI/UX & Navigation (15%) and Content & Gallery (15%) rubric scores |
| G2 | Persist visitor inquiries to a database via a Servlet | Directly assessed in Database Persistence (20%) |
| G3 | Secure the admin portal with session-based authentication | Directly assessed in Security & Sessions (20%) |
| G4 | Display all inquiries in an interactive DataTable | Directly assessed in Admin Dashboard (20%) |
| G5 | Submit a complete, professional ZIP package with video | Directly assessed in Organization & Video (10%) |

---

## 3. Users

| Role | Description | Entry Point |
|------|-------------|-------------|
| **Public Visitor** | Anyone browsing the tourism website, potentially planning a trip to Kuala Selangor. Submits inquiries. | `/index.jsp` |
| **Admin / Staff** | Tourism office staff who log in to view and manage visitor inquiries. | `/admin/login.jsp` |

---

## 4. Technical Stack

| Layer | Technology | Version |
|-------|-----------|---------|
| Language | Java | 17 |
| Web Framework | Jakarta Servlet + JSP | Servlet 6.0, JSP 3.1 |
| Template Tags | JSTL | 3.0 |
| Build Tool | Apache Maven | (via `mvnw` wrapper) |
| Runtime / Server | Eclipse Jetty (embedded via Maven plugin) | 12.0.21 |
| Database | PostgreSQL | Any recent version |
| JDBC Driver | `org.postgresql:postgresql` | 42.7.3 |
| CSS Framework | Bootstrap | 5.3.2 |
| Icons | Font Awesome | 6.5.0 |
| Table Plugin | jQuery DataTables | 1.13.8 |
| jQuery | jQuery | 3.7.1 |

> **Note on DBMS:** The assignment specifies MySQL. This project uses **PostgreSQL** locally, which is acceptable under the "or any DBMS" clause. The SQL syntax used (`SERIAL`, `ON CONFLICT`) is PostgreSQL-specific and must be adapted if the submission environment uses MySQL.

---

## 5. Pages & Features

### 5.1 Public Website

#### 5.1.1 Home (`/index.jsp`)

**Purpose:** The hero landing page introducing Kuala Selangor.

**Contains:**
- Full-viewport hero section with a background image and overlay
- Visit Malaysia 2026 sun bear mascot (`Mao`) positioned on the hero
- Headline: *"Discover Kuala Selangor"*
- Two CTA buttons: **Explore Gallery** → `/gallery.jsp`, **Plan Your Visit** → `/contact.jsp`
- Info strip with 4 landmark cards (Sky Mirror, Fireflies, Bukit Melawati, Seafood)
- About section with destination copy and image
- Sky Mirror highlight section with Google Maps link opening in `target="_blank"`
- Quick-links card grid to all 4 main sections
- Consistent footer with Visit Malaysia 2026 logo

**Assignment requirement met:** Home page with Hero image ✓, Google Maps external link ✓

---

#### 5.1.2 Gallery (`/gallery.jsp`)

**Purpose:** Visual showcase of the destination.

**Contains:**
- Exactly **8 images** of Kuala Selangor (Sky Mirror, fireflies, Bukit Melawati, seafood, river, etc.)
- Responsive grid layout

**Assignment requirement met:** Exactly 8 gallery images ✓

---

#### 5.1.3 Activities (`/activities.jsp`)

**Purpose:** Highlight what visitors can do.

**Contains:**
- Exactly **4 activities**, each with:
  - An image
  - A title and description

**Activities covered:** Sky Mirror trip, Firefly boat tour, Bukit Melawati hike, Seafood dining experience

**Assignment requirement met:** 4 activities with images and descriptions ✓

---

#### 5.1.4 Accommodation (`/accommodation.jsp`)

**Purpose:** Help visitors plan where to stay.

**Contains:**
- Exactly **4 accommodation options**, each with:
  - An image
  - A name and description

**Assignment requirement met:** 4 accommodations with images and descriptions ✓

---

#### 5.1.5 Contact / Inquiry Form (`/contact.jsp`)

**Purpose:** Allow visitors to send inquiries; data is saved to the database.

**Form fields:**
| Field | Type | Validation |
|-------|------|------------|
| Name | Text input | Required |
| Contact Number | Text input | Required |
| Gender | Radio or select | Required |
| Email Address | Email input | Required |
| How did you know about us? | Dropdown `<select>` | Required |
| Message | Textarea | Required |

**Behaviour:**
- **Submit** → POST to `/submit-inquiry` → Servlet saves to DB → Success message displayed inline
- **Clear** → Resets all fields via JavaScript instantly (no page reload)
- Server-side validation backs up client-side checks; if any field is blank, the form re-renders with an error message

**Assignment requirement met:** All 6 form fields ✓, validation ✓, database saving ✓, success message ✓, clear button ✓

---

#### 5.1.6 Developer Page (`/developer.jsp`)

**Purpose:** Required profile page for the developer.

**Contains:**
- Developer photo (`/images/raef.png`)
- Full name
- Student ID: `2022673128`
- Programme: `CDCS230`
- Contact details

**Assignment requirement met:** Developer page ✓

---

#### 5.1.7 Navigation (`/WEB-INF/includes/nav.jsp`)

A shared include rendered on every public page containing links to: Home, Gallery, Activities, Accommodation, Contact, Developer.

**Assignment requirement met:** Consistent navbar on all pages ✓

---

### 5.2 Admin Portal

#### 5.2.1 Admin Login (`/admin/login.jsp` + `/admin/login` POST)

**Purpose:** Authenticate staff before granting access to the dashboard.

**Behaviour:**
- Login form (username + password)
- POST hits `AdminLoginServlet` → queries `admin_users` table using a `PreparedStatement`
- On success: session created (`adminUser` attribute set, 30-minute timeout), redirect to `/admin/dashboard.jsp`
- On failure: form re-renders with error message *"Invalid username or password."*

**Default credentials:** `admin` / `admin123` (seeded via `schema.sql`)

**Assignment requirement met:** Admin login ✓, credential check ✓

---

#### 5.2.2 Session Security (`AuthFilter.java`)

A `@WebFilter("/admin/*")` intercepts every request to the `/admin/` path. If `session.getAttribute("adminUser")` is `null`, the user is redirected to `/admin/login.jsp`. The login page itself is whitelisted.

A secondary guard inside `dashboard.jsp` provides belt-and-suspenders protection.

**Assignment requirement met:** HttpSession ✓, redirect on unauthorized direct URL access ✓

---

#### 5.2.3 Admin Dashboard (`/admin/dashboard.jsp`)

**Purpose:** Show all submitted inquiries in a professional, interactive table.

**Contains:**
- Dark top navigation bar showing the logged-in username and a logout button
- Sidebar with links (Inquiries, View Public Site, Logout)
- Stat card showing total inquiry count (queried live)
- Inquiry table with columns: `#`, Name, Contact, Gender, Email, How Heard, Message (truncated at 80 chars), Submitted At
- jQuery DataTable with: search, sort on all columns (except Message), pagination (10 / page), length menu (5, 10, 25, 50)
- Empty state message: *"No inquiries have been submitted yet."*

**Assignment requirement met:** Admin dashboard ✓, jQuery DataTable with search, sort, pagination ✓

---

#### 5.2.4 Admin Logout (`/admin/logout`)

`AdminLogoutServlet` invalidates the session and redirects to `/admin/login.jsp`.

---

## 6. Database Schema

```sql
-- inquiries: stores public visitor form submissions
CREATE TABLE inquiries (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(255)  NOT NULL,
    contact_number  VARCHAR(50)   NOT NULL,
    gender          VARCHAR(10)   NOT NULL,
    email           VARCHAR(255)  NOT NULL,
    how_heard       VARCHAR(100)  NOT NULL,
    message         TEXT          NOT NULL,
    submitted_at    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- admin_users: staff login credentials
CREATE TABLE admin_users (
    id          SERIAL PRIMARY KEY,
    username    VARCHAR(100) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL
);

-- Seed default admin
INSERT INTO admin_users (username, password)
VALUES ('admin', 'admin123')
ON CONFLICT (username) DO NOTHING;
```

> **Security note:** Passwords are stored in plain text — acceptable for this academic scope but would use bcrypt/Argon2 in production.

---

## 7. File Structure

```
CSC584_INDIVIDUAL/
├── pom.xml                         — Maven build config, Jetty plugin
├── schema.sql                      — Database setup script
├── mvnw / mvnw.cmd                 — Maven wrapper
├── src/main/
│   ├── java/com/uitm/csc584/tourism/
│   │   ├── filter/
│   │   │   └── AuthFilter.java     — Protects /admin/* routes
│   │   ├── model/
│   │   │   └── Db.java             — JDBC connection factory
│   │   └── servlet/
│   │       ├── AdminLoginServlet.java
│   │       ├── AdminLogoutServlet.java
│   │       └── InquiryServlet.java
│   └── webapp/
│       ├── WEB-INF/includes/nav.jsp
│       ├── css/style.css
│       ├── images/
│       │   ├── raef.png
│       │   └── vm2026/
│       ├── admin/
│       │   ├── login.jsp
│       │   └── dashboard.jsp
│       ├── index.jsp
│       ├── gallery.jsp
│       ├── activities.jsp
│       ├── accommodation.jsp
│       ├── contact.jsp
│       └── developer.jsp
```

---

## 8. Running Locally

```bash
# 1. Create the database (PostgreSQL)
psql -U raefdd -c "CREATE DATABASE csc584_tourism;"
psql -U raefdd -d csc584_tourism -f schema.sql

# 2. Start the development server
./mvnw jetty:run

# 3. Open in browser
# Public site:  http://localhost:8080/
# Admin login:  http://localhost:8080/admin/login.jsp
```

---

## 9. Assignment Rubric Self-Assessment

| Criteria | Target | Implementation |
|----------|--------|----------------|
| UI/UX & Navigation (15%) | **Excellent** — responsive, professional, seamless nav | Bootstrap 5, custom CSS, Font Awesome, consistent `nav.jsp` include on all pages |
| Content & Gallery (15%) | **Excellent** — high-quality imagery, well-formatted | 8 gallery images, 4 activities, 4 accommodations, all with descriptions |
| Database Persistence (20%) | **Excellent** — robust JDBC, timestamps, all fields | `InquiryServlet` with `PreparedStatement`, server-side validation, `submitted_at` auto-timestamp |
| Security & Sessions (20%) | **Excellent** — strict access control, logout, session timeout | `AuthFilter` + `@WebFilter`, 30-min session timeout, `AdminLogoutServlet`, belt-and-suspenders check in JSP |
| Admin Dashboard (20%) | **Excellent** — advanced DataTable, professional styling | jQuery DataTables 1.13.8, sort/search/pagination, stat card, dark sidebar layout |
| Organization & Video (10%) | **Excellent** — complete ZIP, working SQL, clear video | `schema.sql` included, structured folders, video should walk through all core flows |

---

## 10. Submission Checklist

- [ ] All 6 public pages functional and linked from navbar
- [ ] Gallery has exactly 8 images
- [ ] Activities has exactly 4 items with images + descriptions
- [ ] Accommodation has exactly 4 items with images + descriptions
- [ ] Google Maps link opens in new tab (`target="_blank"`)
- [ ] Inquiry form validates all 6 fields client-side + server-side
- [ ] Submit saves to DB; success message shown
- [ ] Clear button resets form instantly
- [ ] Admin login works with `admin` / `admin123`
- [ ] Direct URL to `/admin/dashboard.jsp` without login redirects to login
- [ ] Admin logout invalidates session
- [ ] Dashboard DataTable has search, sort, pagination
- [ ] `schema.sql` is included in the ZIP
- [ ] Video walkthrough covers: public site → submit inquiry → admin login → dashboard
- [ ] ZIP is organized (not a flat dump of files)

---

*Document last updated: 2026-06-30*
