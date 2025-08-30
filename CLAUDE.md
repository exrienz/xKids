# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Docker Development
- **Start development environment**: `./docker/scripts/dev-start.sh`
  - Enables file watching with live reload
  - Starts the app at http://localhost:8080
  - Log monitoring available at http://localhost:8081
- **Start with docker-compose**: `docker-compose --profile development up -d`
- **Stop development**: `docker-compose --profile development down`

### Production Deployment
- **Build production image**: `docker build -t xkids-learning-center .`
- **Run production**: `docker run -d -p 8080:80 --name xkids-app xkids-learning-center`
- **Start with docker-compose**: `docker-compose up -d`
- **Multi-platform build**: `docker buildx build --platform linux/amd64,linux/arm64 -t xkids-learning-center .`

## Architecture Overview

This is a containerized educational web application built with vanilla HTML, CSS, and JavaScript, served through nginx. The architecture is designed for simplicity, performance, and security.

### Project Structure
- **Static Web App**: Pure HTML/CSS/JS without build tools or frameworks
- **Containerized Deployment**: Docker-based with nginx serving static files
- **Multi-Module Learning System**: Separate educational modules for different languages/curricula
- **TV/Remote Optimized**: Keyboard navigation support for smart TV interfaces

### Application Modules
1. **Malaysian Reading (Belajar Membaca)**: 5 progressive levels from basic letters to simple sentences
2. **Arabic Reading (Iqra 1-4)**: Traditional Islamic reading curriculum with 4 levels

### Key Components
- **Navigation System** (`src/assets/js/navigation.js`): Keyboard/remote control navigation
- **Audio System** (`src/assets/js/audio.js`): Interactive audio feedback
- **Animation System** (`src/assets/js/animations.js`): Page transitions and visual feedback
- **Responsive Design**: CSS variables and modular stylesheets for cross-device compatibility

### Security & Performance
- **nginx Configuration**: Rate limiting, security headers, CSP policies
- **Asset Optimization**: Long-term caching for static assets, gzip compression
- **Health Monitoring**: Built-in health check endpoints for container orchestration
- **Multi-environment Support**: Separate development and production Docker configurations

### File Organization
- `src/index.html`: Main landing page with module selection
- `src/pages/malay/`: Malaysian reading lessons (malay1.html - malay5.html)  
- `src/pages/iqra/`: Arabic reading lessons (iqra1.html - iqra4.html)
- `src/assets/css/`: Modular CSS architecture (variables, base, components, responsive)
- `src/assets/js/`: Core JavaScript functionality
- `docker/`: Container configuration and deployment scripts
- `docker/nginx/`: Custom nginx configuration for security and performance

### Development Notes
- All lesson pages follow consistent structure with inline CSS for modularity
- Interactive elements use click/touch events with keyboard navigation fallbacks
- Color schemes and design variables are centralized in CSS custom properties
- No external dependencies beyond Bootstrap CSS for basic styling