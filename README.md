# 🌟 XKids Learning Center

Educational web applications for children to learn Malaysian and Arabic reading skills.

## 📱 Applications

- **Malaysian Reading (Belajar Membaca)** - Interactive syllable-based learning
  - Level 1: Huruf Asas (Basic Letters)
  - Level 2: Asas Vokal (Basic Vowels)
  - Level 3: Asas 2 Suku-Kata (Basic 2 Syllables)
  - Level 4: Asas 3 Suku-Kata (Basic 3 Syllables)
  - Level 5: Ayat Ringkas (Simple Sentences)

- **Arabic Reading (Iqra 1-4)** - Traditional Islamic reading curriculum
  - Iqra 1: Basic Arabic letters
  - Iqra 2: Letter combinations
  - Iqra 3: Word formation
  - Iqra 4: Simple sentence reading

## 🐳 Docker Deployment

### Quick Start

```bash
# Build the Docker image
docker build -t xkids-learning-center .

# Run the container
docker run -d -p 8080:80 --name xkids-app xkids-learning-center

# Access the application
open http://localhost:8080
```

### Docker Compose (Recommended)

```bash
# Start with docker-compose
docker-compose up -d

# Access the application
open http://localhost:8080

# View logs
docker-compose logs

# Stop services
docker-compose down
```

### Container Management

```bash
# Stop the container
docker stop xkids-app

# Remove the container
docker rm xkids-app

# View logs
docker logs xkids-app

# Remove the image
docker rmi xkids-learning-center
```

### Build for Different Platforms

```bash
# Build for multiple architectures
docker buildx build --platform linux/amd64,linux/arm64 -t xkids-learning-center .

# Build for specific platform
docker build --platform linux/arm64 -t xkids-learning-center .
```

## 🌐 Features

- **Responsive Design** - Works on mobile, tablet, desktop, and smart TVs
- **Keyboard Navigation** - TV remote and keyboard support
- **Interactive Learning** - Click-based syllable recognition
- **Multi-language** - Supports English, Malay, and Arabic
- **Offline Ready** - No external dependencies required
- **Security Hardened** - CSP, rate limiting, and security headers
- **Performance Optimized** - Gzip compression and asset caching

## 🏗️ Development

### Project Structure

```
src/
├── index.html              # Main landing page
├── assets/
│   ├── css/               # Stylesheets
│   │   ├── base.css       # Core styles
│   │   ├── components.css # Component styles
│   │   ├── responsive.css # Responsive design
│   │   └── variables.css  # CSS variables
│   └── js/                # JavaScript files
│       ├── animations.js  # Page animations
│       ├── audio.js       # Audio functionality
│       └── navigation.js  # Navigation helpers
└── pages/
    ├── malay/             # Malaysian reading lessons
    │   ├── malay1.html    # Level 1: Basic letters
    │   ├── malay2.html    # Level 2: Basic vowels
    │   ├── malay3.html    # Level 3: 2 syllables
    │   ├── malay4.html    # Level 4: 3 syllables
    │   └── malay5.html    # Level 5: Simple sentences
    └── iqra/              # Arabic reading lessons
        ├── iqra1.html     # Iqra 1: Basic letters
        ├── iqra2.html     # Iqra 2: Letter combinations
        ├── iqra3.html     # Iqra 3: Word formation
        └── iqra4.html     # Iqra 4: Sentence reading
```

### Development Mode

```bash
# Start in development mode with file watching
./docker/scripts/dev-start.sh
```

## 🔧 Technical Details

- **Base Image**: nginx:alpine
- **Port**: 80 (mapped to 8080 on host)
- **Size**: ~50MB (optimized)
- **Architecture**: Multi-platform support
- **Security**: CSP, rate limiting, security headers
- **Performance**: Gzip compression, asset caching

## 👨‍💻 Created by

**Made with ❤️ by [Exrienz](https://www.linkedin.com/in/muzaffarmohamed/?originalSubdomain=my)**