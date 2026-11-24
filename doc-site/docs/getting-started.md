# Getting Started

## Requirements

- Docker Desktop
- Git
- Visual Studio Code
- A local copy of the HelpDesk Lite repository

The application is developed using separate frontend, backend, and
database containers. The documentation runs as a separate service.

## Start the project

Open PowerShell in the directory containing `compose.yaml`:

```powershell
docker compose up --build -d
docker compose ps
```

Expected local addresses:

| Service | Address |
|---|---|
| Application | http://localhost:8080 |
| Documentation | http://localhost:8081 |

The documentation service must be added to Compose before the second
address becomes available.

## Common maintenance commands

Read the [Docker Commands](development/docker-commands.md) guide for
build, restart, logs, syntax checks, and troubleshooting.

## Environment configuration

The root `.env` file supplies local development configuration, including
database credentials. It must not contain production secrets in a
repository shared publicly.

Use `.env.example` to document the required configuration variables
with placeholders.

## Current development state

The interface and some PHP routes use temporary mock data. Ticket
persistence, authentication, server-side authorization, and other
mandatory capabilities must be tested before they can be considered
complete.

Do not use sample statistics as evidence of real database records.