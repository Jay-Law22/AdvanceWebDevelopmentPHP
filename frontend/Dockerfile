FROM nginx:alpine

# Install the Nginx configuration used by the application.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the static frontend assets into the web server image.
COPY public/ /usr/share/nginx/html/

EXPOSE 80