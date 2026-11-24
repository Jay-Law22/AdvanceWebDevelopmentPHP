
FROM mysql:8.4

# Include the initial schema in the image.
# MySQL executes this file when initializing a new database volume.
COPY schema.sql /docker-entrypoint-initdb.d/01-schema.sql

