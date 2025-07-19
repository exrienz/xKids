# Simple static web app container for XKids Learning Center
FROM nginx:alpine

# Set maintainer information
LABEL maintainer="Exrienz <muzaffar.mohamed@example.com>"
LABEL description="XKids Learning Center - Educational apps for children"
LABEL version="1.0.0"

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy all HTML files to nginx html directory
COPY *.html /usr/share/nginx/html/

# Create simple nginx configuration
RUN cat > /etc/nginx/conf.d/default.conf << 'EOF'
server {
    listen 80;
    server_name localhost;
    
    root /usr/share/nginx/html;
    index index.html;
    
    # Enable gzip compression
    gzip on;
    gzip_types text/html text/css application/javascript;
    
    # Basic security headers
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    
    # Serve static files
    location / {
        try_files $uri $uri/ /index.html;
    }
    
    # Cache static assets
    location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public";
    }
}
EOF

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]