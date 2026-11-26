# HelpDesk Lite

A web-based IT support ticket management system developed for the **CS334 – Applied Web Programming** project at the Vocational Training Development Institute (VTDI).

**Live Application:** https://helpdesklite.kesug.com/

**Technical Documentation:** https://helpdesklite.kesug.com/docs/

**GitHub Repository:** https://github.com/Jay-Law22/AdvanceWebDevelopmentPHP

---

## 1. Project Overview

HelpDesk Lite is an IT support ticket management application designed to centralize the submission, tracking and management of technical support requests.

The system allows users to submit support tickets, monitor their progress and communicate with the support team. Support agents can manage and respond to tickets, while administrators have additional controls for user and ticket management.

The application uses PHP and MySQL with a simple Model–View–Controller (MVC) structure. It was developed using Docker and Visual Studio Code and deployed using InfinityFree.

## 2. Main Features

### User Authentication and Account Management
- User registration, login and logout.
- Secure password hashing and verification.
- Role-based access for requesters, support agents and administrators.
- Initial administrator setup.
- Administrator controls for creating support agents and managing account status.

### Ticket Management
- Create and submit support tickets.
- View and track submitted tickets.
- Update ticket priority and status.
- Assign tickets to support agents.
- Add comments to ticket conversations.
- Administrator ticket management, including deletion and restoration.

### Dashboard Statistics
Provides application statistics to help users and support staff understand ticket activity and workload.

### Search and Filtering
Allows users to locate relevant tickets using available search and filtering options.

### File Attachments
- Supports PDF, PNG, JPG, JPEG and TXT files.
- Maximum of five attachments per ticket.
- Maximum application-level file size of 5 MB per attachment.
- MIME-type validation and server-generated filenames.
- Authorized attachment downloads.

### Email Notifications
The application uses PHPMailer and authenticated SMTP for transactional email notifications.

The required notification events are:
1. Registration welcome email.
2. Ticket creation confirmation email.

Production email delivery is configured through Gmail SMTP and must be confirmed through the live hosting environment.

## 3. User Roles

| Role | Responsibilities |
|---|---|
| Requester | Register, create tickets, view their own tickets, communicate through comments and follow ticket progress. |
| Support Agent | Access the support workload, manage assigned tickets, update ticket status and priority, and respond to requesters. |
| Administrator | Manage users, create support agents, manage tickets and perform administrative operations. |

Access restrictions are enforced by the PHP backend rather than relying solely on interface visibility.

## 4. Technology Stack

| Technology | Purpose |
|---|---|
| PHP 8.x | Server-side application development |
| MySQL / MariaDB | Relational database |
| PDO | Database access and prepared statements |
| HTML5 | Page structure |
| CSS3 | Custom styling |
| Bootstrap 5 | Responsive interface |
| Bootstrap Icons | Interface icons |
| JavaScript | Browser-side interactions |
| PHPMailer | Transactional email |
| Gmail SMTP | Authenticated email delivery |
| Docker | Local application containerization |
| Docker Compose | Local service orchestration |
| Nginx | Local web serving and PHP request forwarding |
| MkDocs Material | Technical documentation |
| InfinityFree | Free shared hosting |
| Git and GitHub | Version control and project history |
| Visual Studio Code | Development environment |

## 5. System Requirements

### Local Development

- Windows, Linux or macOS.
- Docker Desktop or a compatible Docker installation.
- Docker Compose.
- Visual Studio Code.
- Git.
- Internet access for downloading dependencies and external resources.
- A modern web browser.

The local environment uses PHP 8.4 and MySQL 8.4 through Docker.

### Hosting Requirements

- A supported PHP 8.x hosting environment.
- MySQL or MariaDB database.
- PDO MySQL extension.
- PHP file upload support.
- Apache rewrite support for application routing.
- HTTPS support.
- FTP access for deployment.

The deployed application uses InfinityFree shared hosting.

## 6. Project Structure

```text
helpdesk-lite/
│
├── backend/
│   ├── app/
│   │   ├── Controllers/
│   │   ├── Core/
│   │   ├── Helpers/
│   │   ├── Models/
│   │   └── Views/
│   │
│   ├── public/
│   │   └── index.php
│   │
│   ├── scripts/
│   ├── composer.json
│   ├── composer.lock
│   └── Dockerfile
│
├── frontend/
│   ├── public/
│   │   └── assets/
│   │       ├── css/
│   │       └── js/
│   │
│   ├── nginx.conf
│   └── Dockerfile
│
├── database/
│   ├── schema.sql
│   ├── assessment-data.sql
│   └── ERD.png
│
├── docs-site/
│   ├── docs/
│   ├── mkdocs.yml
│   └── Dockerfile
│
├── compose.yaml
├── .env.example
├── .gitignore
└── README.md
```

The `assessment-data.sql` and `ERD.png` paths represent the assessment deliverables to be included in the completed submission package.

## 7. Local Installation and Setup

### Step 1: Obtain the source code

Clone the GitHub repository:

```bash
git clone https://github.com/Jay-Law22/AdvanceWebDevelopmentPHP.git
```

Navigate into the project directory:

```bash
cd helpdesk-lite
```

### Step 2: Configure environment variables

Create a local environment file from the example:

```powershell
Copy-Item .env.example .env
```

Configure the required application, database and SMTP values in `.env`.

The actual `.env` file contains development credentials and must not be committed to GitHub.

### Step 3: Start the application

Run:

```bash
docker compose up --build -d
```

Check the running services:

```bash
docker compose ps
```

### Step 4: Access the application

| Service | Local address |
|---|---|
| HelpDesk Lite | http://localhost:8080 |
| Technical Documentation | http://localhost:8081 |

### Step 5: Initial administrator setup

On a fresh database, navigate to:

```text
http://localhost:8080/setup/admin
```

Create the initial administrator account.

After an administrator exists, the initial setup route closes to prevent additional public administrator creation.

Support agent accounts can subsequently be created through the administrator interface. Requester accounts can be registered through the normal registration page.

### Step 6: Inspect application logs

```bash
docker compose logs --tail=100 backend
docker compose logs --tail=100 db
docker compose logs --tail=100 frontend
```

Additional commands are available in the technical documentation.

## 8. Database Design and Initialization

The application uses a relational database with seven tables:

| Table | Purpose |
|---|---|
| `users` | Stores user accounts, roles and account status. |
| `tickets` | Stores support tickets, their owners, assignments, priorities and statuses. |
| `ticket_comments` | Stores communication associated with support tickets. |
| `activity_logs` | Records application activity. |
| `admin_audit_logs` | Records administrative operations. |
| `ticket_attachments` | Stores metadata about uploaded ticket attachments. |
| `schema_migrations` | Tracks applied database migrations. |

### Database Deliverables

- `database/schema.sql` — Database structure and initialization.
- `database/assessment-data.sql` — Synthetic assessment records.
- `database/ERD.png` — Entity Relationship Diagram.

The assessment data is intended to be applied after the required evaluation accounts have been created.

For the InfinityFree deployment, a compatible schema copy is used through phpMyAdmin.

The live production database is separate from the local development database.

## 9. Demonstration Accounts

The following evaluation accounts are provided for demonstrating the application's access roles.

| Account | Role | Login email |
|---|---|---|
| Evaluation Administrator | Administrator | [Insert administrator email] |
| Evaluation Support Agent | Support Agent | [Insert agent email] |
| Evaluation Requester 1 | Requester | [Insert requester 1 email] |
| Evaluation Requester 2 | Requester | [Insert requester 2 email] |

The accounts are created using the application's normal account-management and registration workflows.

Passwords should be communicated securely to the lecturer separately and must not be committed to a public repository.

## 10. Demonstration Scenarios

The application can be demonstrated through the following workflows:

1. Register and authenticate as a requester.
2. Create a support ticket and attach a permitted file.
3. View the requester's own submitted tickets.
4. Authenticate as a support agent.
5. Locate and manage assigned support tickets.
6. Change ticket priority and status.
7. Add comments to a ticket conversation.
8. Authenticate as an administrator.
9. Create a support agent and manage account statuses.
10. Demonstrate administrator ticket management, including deletion and restoration.
11. Demonstrate Dashboard Statistics.
12. Demonstrate Search and Filtering.
13. Demonstrate the registration welcome email and ticket creation confirmation email.
14. Demonstrate that one requester cannot access another requester's tickets or attachments.

Only synthetic support information should be used during the assessment demonstration.

## 11. Security Controls

HelpDesk Lite implements security controls appropriate to its application workflows.

These include:

- Password hashing with `password_hash()` and verification with `password_verify()`.
- Session ID regeneration after successful authentication.
- Session invalidation during logout.
- CSRF protection for state-changing forms.
- PDO prepared statements for database operations.
- HTML output escaping using `htmlspecialchars()`.
- Server-side authentication and role authorization.
- Ticket ownership verification.
- MIME-type and file-size validation.
- Randomly generated attachment filenames.
- Protected attachment storage and authorized downloads.
- POST requests for state-changing operations.
- Generic production error responses.
- Separation of application credentials from source code.

The application should be operated over HTTPS in its hosted environment.

## 12. Production Deployment

HelpDesk Lite is hosted on InfinityFree:

**Application:** https://helpdesklite.kesug.com/

**Documentation:** https://helpdesklite.kesug.com/docs/

The InfinityFree deployment uses a separate application copy adapted for shared PHP hosting.

The production deployment does not run Docker Compose. Docker remains the local development and testing environment.

### Production Configuration

The hosted application uses a protected PHP configuration file for:

- Database connection details.
- Application environment.
- Gmail SMTP settings.
- Email sender details.

Production credentials must never be included in GitHub.

The Composer dependencies are installed locally and uploaded with the application.

### Email Configuration

The hosted application uses Gmail SMTP with:

```text
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_ENCRYPTION=tls
```

A Google App Password is required for authenticated Gmail SMTP access.

The normal Gmail account password must not be used.

See the technical documentation for the complete deployment procedure.

## 13. Known Limitations

- InfinityFree is a free shared-hosting environment and does not provide the same server administration capabilities as a VPS.
- Docker Compose runs locally and is not available on the InfinityFree hosting account.
- Production updates require transferring the updated files through FTP.
- Composer dependencies must be installed locally before deployment.
- Free hosting resource limits and availability are controlled by the hosting provider.
- Database and uploaded attachment backups must be maintained separately.
- Transactional email delivery depends on the Gmail account configuration and the hosting provider's network policies.

## 14. External Dependencies and Attribution

The project uses the following external packages and resources:

| Dependency | Purpose |
|---|---|
| PHPMailer | Authenticated SMTP email |
| Bootstrap | Responsive interface framework |
| Bootstrap Icons | Interface icons |
| Geist Font | Application typography |
| MkDocs Material | Technical documentation theme |

Their respective licenses and documentation should be consulted when reusing or redistributing them.

## 15. Generative AI Use Declaration

Generative AI tools were used for planning, technical explanations, debugging assistance and documentation support during development.

All AI-assisted work was reviewed and integrated into the project by the student. The student remains responsible for understanding, testing, demonstrating and explaining the submitted implementation.

## 16. Project Documentation

The complete technical documentation is published at:

https://helpdesklite.kesug.com/docs/

It covers:

- Getting started and local setup.
- Application architecture and directory structure.
- Docker development commands.
- PHP coding practices.
- Application security controls.
- InfinityFree deployment and maintenance.

## 17. Academic Information

**Module:** CS334 – Applied Web Programming

**Institution:** Vocational Training Development Institute (VTDI)

**Project:** HelpDesk Lite

**Submission date:** December 5, 2026

**Project members:** [Insert group member names]

