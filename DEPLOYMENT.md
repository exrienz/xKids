# 🐳 XKids Learning Center - Docker Deployment Guide

This guide will help you deploy the XKids Learning Center application using Docker.

## 📋 Prerequisites

- Docker (version 20.10+)
- Docker Compose (version 2.0+)
- 4GB RAM minimum
- 1GB free disk space

## 🚀 Quick Start

### Option 1: Simple Deployment (Development)

```bash
# Clone or navigate to the project directory
cd /path/to/xkids

# Build and run the application
docker-compose up -d

# Access the application
open http://localhost:8080
```

### Option 2: Production Deployment with SSL

```bash
# Run production services with Traefik
docker-compose --profile production up -d

# Access the application with SSL
open https://xkids.exrienz.com
```

## 🛠️ Build Options

### Build Docker Image Manually

```bash
# Build the image
docker build -t xkids-learning-center:latest .

# Run a container
docker run -d -p 8080:80 --name xkids-app xkids-learning-center:latest

# View logs
docker logs xkids-app

# Stop and remove
docker stop xkids-app && docker rm xkids-app
```

### Build with Custom Tag

```bash
# Build with version tag
docker build -t xkids-learning-center:v1.0.0 .

# Tag for registry
docker tag xkids-learning-center:v1.0.0 your-registry/xkids-learning-center:v1.0.0
```

## 🔧 Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `NGINX_HOST` | localhost | Hostname for the application |
| `NGINX_PORT` | 80 | Internal nginx port |

### Port Configuration

- **Development**: `8080:80` (Access via http://localhost:8080)
- **Production**: `80:80` and `443:443` (Standard HTTP/HTTPS ports)

## 📊 Monitoring & Health Checks

### Health Check Endpoint

```bash
# Check application health
curl http://localhost:8080/health

# Expected response: "healthy"
```

### Container Health Status

```bash
# Check container health
docker ps
# Look for "healthy" status

# View detailed health check logs
docker inspect xkids-learning-center | grep -A 10 "Health"
```

## 🔒 Security Features

### Built-in Security Headers

- **X-Frame-Options**: Prevents clickjacking
- **X-XSS-Protection**: XSS attack protection
- **X-Content-Type-Options**: MIME type sniffing protection
- **Content-Security-Policy**: Restrict resource loading
- **Referrer-Policy**: Control referrer information

### SSL/TLS (Production)

The production setup includes:
- Automatic SSL certificate generation via Let's Encrypt
- HTTP to HTTPS redirection
- TLS termination with Traefik

## 🚀 Production Deployment

### Domain Setup

1. Update `docker-compose.yml` with your domain:
```yaml
labels:
  - "traefik.http.routers.xkids.rule=Host(`your-domain.com`)"
```

2. Point your domain's DNS to your server's IP

3. Deploy with production profile:
```bash
docker-compose --profile production up -d
```

### SSL Certificate Management

Certificates are automatically managed by Traefik and stored in the `ssl-certs` volume.

## 📈 Performance Optimization

### Nginx Configuration

The Docker image includes optimized nginx settings:
- **Gzip compression** for faster loading
- **Static asset caching** (1 year for assets, 1 hour for HTML)
- **Proper MIME types** for all file types

### Resource Limits

Add resource limits in production:

```yaml
services:
  xkids-app:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
```

## 🔍 Troubleshooting

### Common Issues

**Container won't start:**
```bash
# Check logs
docker-compose logs xkids-app

# Check container status
docker ps -a
```

**Health check failing:**
```bash
# Test health endpoint manually
curl http://localhost:8080/health

# Check nginx configuration
docker exec -it xkids-learning-center nginx -t
```

**Permission issues:**
```bash
# Fix file permissions
docker exec -it xkids-learning-center chown -R nginx:nginx /usr/share/nginx/html
```

### Performance Issues

**Slow loading:**
```bash
# Check gzip is working
curl -H "Accept-Encoding: gzip" -v http://localhost:8080/

# Monitor resource usage
docker stats xkids-learning-center
```

## 📦 Container Registry

### Push to Registry

```bash
# Login to your registry
docker login your-registry.com

# Tag the image
docker tag xkids-learning-center:latest your-registry.com/xkids-learning-center:latest

# Push to registry
docker push your-registry.com/xkids-learning-center:latest
```

### Pull and Deploy

```bash
# Pull from registry
docker pull your-registry.com/xkids-learning-center:latest

# Update docker-compose.yml
# image: your-registry.com/xkids-learning-center:latest

# Deploy
docker-compose up -d
```

## 🔄 Updates and Maintenance

### Application Updates

```bash
# Rebuild with latest changes
docker-compose build --no-cache

# Restart services
docker-compose up -d

# Remove old images
docker image prune -f
```

### Backup and Restore

```bash
# Export container (backup)
docker export xkids-learning-center > xkids-backup.tar

# Import container (restore)
docker import xkids-backup.tar xkids-learning-center:backup
```

## 📋 Useful Commands

```bash
# View all containers
docker-compose ps

# View logs
docker-compose logs -f xkids-app

# Restart specific service
docker-compose restart xkids-app

# Stop all services
docker-compose down

# Stop and remove volumes
docker-compose down -v

# Update and restart
docker-compose pull && docker-compose up -d

# Execute commands in container
docker exec -it xkids-learning-center sh

# Monitor resource usage
docker stats xkids-learning-center
```

## 🌐 Multi-Platform Support

The Docker image supports multiple architectures:
- `linux/amd64` (Intel/AMD)
- `linux/arm64` (Apple Silicon, ARM servers)
- `linux/arm/v7` (Raspberry Pi)

## 📞 Support

For deployment issues:
1. Check the troubleshooting section above
2. View container logs: `docker-compose logs`
3. Contact: [LinkedIn Profile](https://www.linkedin.com/in/muzaffarmohamed/?originalSubdomain=my)

---

**Made with ❤️ by Exrienz**