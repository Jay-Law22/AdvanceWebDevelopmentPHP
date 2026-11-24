# HelpDesk Lite Documentation

Welcome to the developer documentation for **HelpDesk Lite**, a web-based IT support ticket management system being developed as part of the CS334 Applied Web Programming course at the Vocational Training Development Institute (VTDI).

HelpDesk Lite aims to provide a centralized system for submitting support requests, monitoring their status, and managing IT support activities.

## Project objectives

- Allow users to register, log in, and submit IT support requests.
- Organize tickets by category, priority, and status.
- Provide a centralized interface for managing support requests.
- Support different user roles, including requesters, agents, and administrators.
- Store application records in a relational database.
- Apply secure PHP development practices and a simple MVC architecture.
- Use Docker Compose to run the application and supporting services.
- Maintain clear technical documentation throughout development.

## Technology stack

| Technology | Purpose |
|---|---|
| PHP 8.4 | Server-side application logic |
| MySQL 8.4 | Relational database |
| PDO | Database access |
| HTML5 | Page structure |
| CSS3 | Custom styling |
| Bootstrap | Responsive interface components |
| JavaScript | Browser-side interactions |
| Nginx | Web server and PHP request forwarding |
| Docker | Application containerization |
| Docker Compose | Service orchestration |
| MkDocs Material | Developer documentation |
| Visual Studio Code | Development environment |

The application is currently being developed with PHP-rendered pages, reusable templates, Bootstrap, custom CSS, and JavaScript. The primary backend is organized using a simple Model–View–Controller (MVC) structure.

## Local development URLs

| Service | URL |
|---|---|
| HelpDesk Lite application | [http://localhost:8080](http://localhost:8080) |
| Developer documentation | [http://localhost:8081](http://localhost:8081) |

These URLs are for the local Docker development environment, not a public production deployment.

## Application services

HelpDesk Lite runs using four Docker Compose services:

- **Frontend:** Nginx serves frontend assets and forwards PHP requests.
- **Backend:** PHP-FPM executes the PHP application.
- **Database:** MySQL stores application data.
- **Documentation:** MkDocs Material serves the developer handbook.

## Current implementation status

The following has been verified during development:

- The Docker Compose environment has been configured.
- The MySQL database contains the `users`, `tickets`, `ticket_comments`, and `activity_logs` tables.
- User registration and login have been tested successfully.
- The application has reusable PHP layouts, partials, and components.
- The documentation site runs separately from the main application.

The presence of a page or database table does not necessarily mean its complete workflow has been implemented. Ticket persistence, assignment, comments, activity logging, notifications, and other outstanding requirements must be tested as those features are developed.

## Documentation guide

Use the navigation menu to explore:

- **Application Structure:** The directory layout and responsibilities of each application layer.
- **Docker Commands:** How to run, inspect, and rebuild the application.
- **PHP Reference:** The coding patterns used throughout the backend.
- **Security Controls:** Authentication, authorization, input validation, and other security requirements.
- **Rubric Checklist:** The project requirements and remaining implementation work.

## Development principle

Implementation status should be based on tested functionality, not only on the existence of source files. The documentation will be updated as each feature is completed and verified.