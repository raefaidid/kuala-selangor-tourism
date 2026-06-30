# Deployment Guide
## Kuala Selangor Tourism App — CSC584 MVP

This guide is written for a first-time deployer. By the end you will have a live URL
anyone can visit on the internet.

---

## What "deploying" actually means

Your app currently only runs on your laptop. Deploying means:

1. Copying your code to a **server** (a computer that runs 24/7, connected to the internet)
2. Running your app on that server
3. The server gets a public URL (e.g. `https://kuala-selangor.railway.app`)

Your app needs two things on the server:
- **A Java runtime** to run your Servlets/JSP (Jetty handles this for you)
- **A PostgreSQL database** (or MySQL if you switch)

---

## Overview of Options

| Method | Cost | Difficulty | Best for |
|--------|------|------------|----------|
| [Railway](#option-a-railway--recommended-free) | Free tier available | ⭐ Easiest | Beginners, assignments |
| [Render](#option-b-render--free-with-limits) | Free tier (DB expires after 90 days) | ⭐⭐ Easy | Assignments with demo period |
| [DigitalOcean Droplet](#option-c-digitalocean-droplet--low-budget) | ~USD 6/month | ⭐⭐⭐ Medium | Longer-lived projects |
| [Hetzner VPS](#option-d-hetzner-vps--cheapest-paid) | ~EUR 4/month | ⭐⭐⭐ Medium | Best value paid option |

---

## Before You Deploy Anything

### Step 1 — Make your DB connection use environment variables

Right now `Db.java` has your credentials hardcoded. That won't work on a server
(and is a security risk if you push to GitHub). You need to change it to read from
environment variables.

Open [src/main/java/com/uitm/csc584/tourism/model/Db.java](src/main/java/com/uitm/csc584/tourism/model/Db.java) and replace the body with:

```java
public final class Db {

    private static final String URL      = System.getenv().getOrDefault("DB_URL",      "jdbc:postgresql://localhost:5432/csc584_tourism");
    private static final String USER     = System.getenv().getOrDefault("DB_USER",     "raefdd");
    private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "");

    private Db() {}

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
```

This still works locally (falls back to your laptop settings) and will read real
credentials on any server.

### Step 2 — Push your code to GitHub

Every platform below deploys from GitHub. If you haven't done this yet:

```bash
cd /Users/raefdd/uitm-degree/enterprise-programming/projects/CSC584_INDIVIDUAL

git init
git add .
git commit -m "Initial commit — CSC584 MVP"

# Create a repo on github.com, then:
git remote add origin https://github.com/YOUR_USERNAME/csc584-tourism.git
git push -u origin main
```

> Make sure you do **not** commit secrets. Add a `.gitignore` that at minimum
> ignores the `target/` folder (Maven build output).

---

## Option A: Railway — Recommended (Free)

Railway is the easiest platform for Java/PostgreSQL apps. It has a free tier that
is sufficient for demo purposes.

**What you get:** Free $5 credit / month, sleeps after inactivity on free tier.

### Steps

**1. Sign up**

Go to [railway.app](https://railway.app) and sign up with your GitHub account.

**2. Create a new project**

- Click **"New Project"**
- Choose **"Deploy from GitHub repo"**
- Authorise Railway to access your repo and select it

**3. Add a PostgreSQL database**

- Inside your Railway project, click **"+ New"**
- Select **"Database" → "Add PostgreSQL"**
- Railway spins up a database and gives you connection variables automatically

**4. Set environment variables**

Click on your **app service** (not the database) → go to **Variables** tab → add:

| Key | Value |
|-----|-------|
| `DB_URL` | Copy from Railway's Postgres service: `JDBC_DATABASE_URL` — it looks like `jdbc:postgresql://HOST:PORT/DB_NAME` |
| `DB_USER` | Copy `PGUSER` from Railway's Postgres variables |
| `DB_PASSWORD` | Copy `PGPASSWORD` from Railway's Postgres variables |

**5. Set the start command**

Railway needs to know how to start your app. In your service settings under
**"Start Command"**, enter:

```
./mvnw jetty:run
```

**6. Set up the database schema**

Once your PostgreSQL service is running, Railway gives you a "Connect" button with
a CLI command. Run:

```bash
# Railway gives you a command like this in their dashboard:
railway run psql -f schema.sql
```

Or connect with any PostgreSQL client (TablePlus, DBeaver) using the credentials
Railway shows you.

**7. Deploy**

Push a commit to GitHub — Railway auto-deploys. In a few minutes you'll see a
live URL like `https://your-project.railway.app`.

---

## Option B: Render — Free (with limits)

Render's free tier sleeps after 15 minutes of inactivity (first request takes ~30s to
wake up). The free PostgreSQL database expires after **90 days**.

### Steps

**1. Sign up at [render.com](https://render.com)**

**2. Create a Web Service**

- New → Web Service → Connect your GitHub repo
- **Environment:** Java
- **Build command:** `./mvnw clean package -DskipTests`
- **Start command:** `java -jar target/dependency/jetty-runner.jar target/tourism-kuala-selangor.war`

  > Actually for Jetty plugin approach use: `./mvnw jetty:run`

**3. Create a PostgreSQL database**

- New → PostgreSQL
- Copy the **Internal Database URL** — it looks like `postgresql://user:pass@host/dbname`
- Convert it to JDBC format: `jdbc:postgresql://host/dbname`

**4. Set environment variables** (same as Railway above)

**5. Run schema.sql**

Use Render's dashboard → your DB → "Connect" tab → run the SQL there.

---

## Option C: DigitalOcean Droplet — Low Budget

**Cost:** ~USD 6/month for the cheapest droplet (1 vCPU, 1 GB RAM — enough for this app).

This is a Linux VPS (Virtual Private Server) — a real computer in a data centre
that you control via SSH. More steps but you own it completely.

### Steps

**1. Sign up at [digitalocean.com](https://digitalocean.com)**

They give USD 200 free credit for 60 days as a new user — essentially free for 2 months.

**2. Create a Droplet**

- Choose **Ubuntu 24.04 LTS**
- Size: **Basic → Regular → USD 6/month** (1 vCPU, 1 GB)
- Region: Singapore (closest to Malaysia)
- Authentication: SSH key (they'll guide you) or password

**3. Connect to your server**

```bash
ssh root@YOUR_DROPLET_IP
```

**4. Install Java and PostgreSQL**

```bash
# Update packages
apt update && apt upgrade -y

# Install Java 17
apt install -y openjdk-17-jdk

# Install PostgreSQL
apt install -y postgresql postgresql-contrib

# Install Maven
apt install -y maven

# Install Git
apt install -y git
```

**5. Set up PostgreSQL**

```bash
# Switch to postgres user
su - postgres

# Create database and user
psql
CREATE DATABASE csc584_tourism;
CREATE USER tourismapp WITH PASSWORD 'choose-a-strong-password';
GRANT ALL PRIVILEGES ON DATABASE csc584_tourism TO tourismapp;
\q

exit  # back to root
```

**6. Clone your code**

```bash
cd /opt
git clone https://github.com/YOUR_USERNAME/csc584-tourism.git
cd csc584-tourism
```

**7. Set environment variables**

```bash
export DB_URL="jdbc:postgresql://localhost:5432/csc584_tourism"
export DB_USER="tourismapp"
export DB_PASSWORD="choose-a-strong-password"
```

**8. Run the schema**

```bash
psql -U tourismapp -d csc584_tourism -f schema.sql
```

**9. Build and run**

```bash
./mvnw clean package -DskipTests
./mvnw jetty:run -Djetty.http.port=80
```

Your app is now live at `http://YOUR_DROPLET_IP/`.

> For a proper domain and HTTPS, look up "DigitalOcean domain + Let's Encrypt Certbot"
> once you're comfortable.

**10. Keep it running after you close the terminal**

```bash
# Install screen to keep the process alive
apt install -y screen

screen -S tourism
./mvnw jetty:run -Djetty.http.port=80
# Press Ctrl+A, then D to detach. App keeps running.
```

---

## Option D: Hetzner VPS — Cheapest Paid

[Hetzner](https://hetzner.com/cloud) is a German provider with servers in Singapore.
The CX22 plan is about **EUR 4/month** — the cheapest real VPS available.

The setup process is **identical to DigitalOcean** above (same Ubuntu commands).
The only difference is where you sign up and create the server.

Best pick if you want the cheapest long-term option after your assignment is done.

---

## Quick Comparison Summary

```
FREE OPTIONS
├── Railway    → Easiest setup, auto-deploy from GitHub, free credits
└── Render     → Similar to Railway, DB expires after 90 days for free

PAID OPTIONS (assignment + learning portfolio)
├── DigitalOcean → USD 6/mo, USD 200 free credit for new users (2 months free!)
└── Hetzner      → EUR 4/mo, best price in the long run
```

**My recommendation for your assignment:**

1. Do **Railway** first — it's the fastest path to a live URL with zero server admin.
2. If you want to learn real server management (good for your portfolio), do
   **DigitalOcean** with their new-user credit — it's effectively free for 2 months.

---

## Common Problems for First-Timers

| Problem | Likely cause | Fix |
|---------|-------------|-----|
| App starts but shows DB error | `DB_URL` / `DB_USER` / `DB_PASSWORD` env vars not set | Double-check the Variables tab on Railway/Render |
| `schema.sql` uses `SERIAL` but server runs MySQL | Assignment says MySQL but this project uses PostgreSQL SQL syntax | Either switch to Railway/Render with PostgreSQL, or adapt schema to MySQL syntax (`AUTO_INCREMENT`, `INT`) |
| App builds but Jetty doesn't start | Port 80 requires root on Linux | Use port 8080 and configure a reverse proxy, or run as root |
| `./mvnw` permission denied | Maven wrapper not executable | Run `chmod +x mvnw` on the server |

---

*Guide written for CSC584 MVP — June 2026*
