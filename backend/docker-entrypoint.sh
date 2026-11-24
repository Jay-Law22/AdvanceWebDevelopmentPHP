#!/bin/sh

set -eu

mkdir -p /var/www/uploads/ticket-attachments
chown www-data:www-data /var/www/uploads /var/www/uploads/ticket-attachments
chmod 0750 /var/www/uploads/ticket-attachments

attempt=1
max_attempts=30

echo "HelpDesk Lite: checking database migrations..."

until php /var/www/html/scripts/migrate.php; do
    if [ "$attempt" -ge "$max_attempts" ]; then
        echo "HelpDesk Lite: database migrations failed after retries." >&2
        exit 1
    fi

    echo "Database is not ready yet; retrying in 2 seconds..."
    attempt=$((attempt + 1))
    sleep 2
done

echo "HelpDesk Lite: database migrations are ready."

exec "$@"
