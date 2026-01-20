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
3. **Math Module (Levels 1-10)**: Interactive math learning for ages 3-6 with hidden answer logic
   - Levels 1-5: Completed with full interactive answer system
   - Levels 6-10: In progress (following established pattern)

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
- `src/pages/math/`: Math learning module (math1.html - math10.html)
- `src/assets/css/`: Modular CSS architecture (variables, base, components, responsive)
- `src/assets/js/`: Core JavaScript functionality
- `docker/`: Container configuration and deployment scripts
- `docker/nginx/`: Custom nginx configuration for security and performance

### Development Notes
- All lesson pages follow consistent structure with inline CSS for modularity
- Interactive elements use click/touch events with keyboard navigation fallbacks
- Color schemes and design variables are centralized in CSS custom properties
- No external dependencies beyond Bootstrap CSS for basic styling

### Math Module Specific Implementation

#### Answer Reveal Logic (NEW!)
All math lessons implement a **hidden answer system**:
- Answers are **NOT displayed** until the child submits a correct response
- Number pad input (0-10) + clear button for answer selection
- Submit button checks the answer
- Visual feedback (animations, sounds) for correct/incorrect attempts
- Only after correct submission is the answer revealed with celebration

#### Interactive Components
- **Number Pad**: Grid of buttons (0-10 + clear) for easy input
- **Submit Button**: Validates answer and provides feedback
- **Visual Feedback**:
  - Success: Pulsing animation + green gradient
  - Error: Shake animation + encouraging message
- **Audio Feedback**: Success, error, and completion sounds
- **Progress Tracking**: Star system (up to 10 stars displayed)

#### Math Lesson Structure (Levels 1-5 Completed)
1. **math1.html**: Number Recognition (1-10) - Count dots and identify numbers
2. **math2.html**: Addition within 5 - Visual apple addition
3. **math3.html**: Subtraction within 5 - Visual orange subtraction with crossed-out display
4. **math4.html**: Bigger vs Smaller - NEW comparison concept with elephant/mouse visuals
5. **math5.html**: Addition within 10 - Visual banana addition

#### Remaining Math Lessons (6-10)
Follow the EXACT same pattern as lessons 1-5 with these topics:
- **math6.html**: Subtraction within 10 (stars ⭐)
- **math7.html**: Two-digit Number Recognition 11-20 (grouped dots)
- **math8.html**: Simple Two-digit Addition (hearts ❤️, no carrying needed)
- **math9.html**: Fun with Multiplication (groups of cookies 🍪)
- **math10.html**: Basic Division - Sharing (pizza slices 🍕)

#### Age-Appropriate Design (3-6 years)
- Large, colorful buttons and text
- Emoji-based visuals for engagement
- Simple, encouraging language
- No penalties for wrong answers
- Positive reinforcement with stars and sounds
- Progressive difficulty from counting to basic operations