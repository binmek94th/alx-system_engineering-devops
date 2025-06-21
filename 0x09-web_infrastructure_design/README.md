# 🌐 Web Infrastructure Project

This project demonstrates the evolution and design of a production-grade web infrastructure — starting from a single-server architecture to a highly available, secure, and scalable multi-server setup.

---

## 🛠️ Infrastructure Components

### Phase 1: Single Server Setup
- **1 server** (IP: `8.8.8.8`)
- **Domain**: `www.foobar.com` (DNS A record → 8.8.8.8)
- **Web Server**: Nginx
- **Application Server**: Django or Flask
- **Database**: MySQL
- **Application Files**: Hosted on the same machine

### Phase 2: Scaled with Load Balancer
- **2 Servers** (web + app split)
- **HAProxy** as a Load Balancer (Round Robin strategy)
- **Database**: Primary-Replica (MySQL Master-Slave)
- **Separation of concerns**: Web, App, and DB on different machines

### Phase 3: Security and Monitoring Added
- **Firewalls**: 3 layers (public ↔ LB, LB ↔ web/app, internal)
- **HTTPS**: SSL termination at load balancer (SSL certificate for `www.foobar.com`)
- **Monitoring**: SumoLogic (or similar) with agents installed on all services
  - Monitored metrics: QPS (queries per second), CPU, memory, response time

### Phase 4: High Availability and Full Separation
- **HAProxy Cluster** (2 Load Balancers using Keepalived with virtual IP)
- **Dedicated servers**:
  - Web Server (Nginx)
  - Application Server (Gunicorn, Node.js, etc.)
  - Database: Primary + Read Replica
- **CI/CD ready**: Separated layers allow safe and independent deployments

---

## 💡 Key Concepts

- **DNS A Record**: Maps `www.foobar.com` to the public IP of the load balancer.
- **Load Balancer Algorithm**: Round Robin (distributes traffic evenly).
- **Active-Passive LB Setup**: One LB is active, the other waits for failover.
- **Firewall**: Protects internal services from unauthorized access.
- **SSL/TLS**: Encrypts traffic to ensure secure connections.
- **Database Replication**:
  - **Primary**: Handles all writes.
  - **Replica**: Handles read-only queries, improves performance.

---

## ⚠️ Infrastructure Challenges

| Challenge | Explanation |
|----------|-------------|
| **SPOF** (Single Point of Failure) | Solved by load balancer clustering and DB replication |
| **Downtime during deployment** | Mitigated by splitting services and using CI/CD |
| **No HTTPS** | Solved via SSL certificate and secure redirection |
| **No monitoring** | Solved by integrating monitoring agents |
| **Write bottlenecks** | Solved by separating DB reads/writes |
| **Resource contention** | Solved by dedicated servers per component |

---

## ✅ Tools Used

- **Nginx** – Web server and reverse proxy
- **HAProxy** – Load balancer
- **MySQL** – Relational database
- **Gunicorn / uWSGI** – Python application server
- **Docker & Docker Compose** – Container orchestration
- **Keepalived** – Load balancer failover
- **SSL (Let's Encrypt)** – Certificate for HTTPS
- **SumoLogic / Prometheus / Grafana** – Monitoring tools

---
