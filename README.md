# 🌟 XKids Learning Center

Educational web applications for children to learn Malaysian and Arabic reading skills.

## 📱 Applications

- **Malaysian Reading (Belajar Membaca)** - Interactive syllable-based learning
  - Level 1: Huruf Asas (Basic Letters)
  - Level 2: Asas Vokal (Basic Vowels)
  - Level 3: Asas 2 Suku-Kata (Basic 2 Syllables)
  - Level 4: Asas 3 Suku-Kata (Basic 3 Syllables)
  - Level 5: Ayat Ringkas (Simple Sentences)

- **Arabic Reading (Iqra 1-9)** - Traditional Islamic reading curriculum for ages 3-9 (All interactive games! ✅)
  - Iqra 1: Basic Arabic letters ✅
  - Iqra 2: Vowel marks (harakat) with letters ✅
  - Iqra 3: Word formation ✅
  - Iqra 4: Three-letter word reading ✅
  - Iqra 5: Letter forms in all positions (all 28 letters) ✅
  - Iqra 6: Letter blending and short words ✅
  - Iqra 7: Sukun and Shaddah (advanced combinations) ✅
  - Iqra 8: Tanween and long vowels (madd) ✅
  - Iqra 9: Quranic reading with basic tajweed ✅

- **Math Module (Levels 1-10)** - Interactive math learning for ages 3-6
  - Level 1: Number Recognition (1-10) ✅
  - Level 2: Addition within 5 ✅
  - Level 3: Subtraction within 5 ✅
  - Level 4: Bigger vs Smaller Comparison ✅
  - Level 5: Addition within 10 ✅
  - Level 6: Subtraction within 10 (In Progress)
  - Level 7: Two-digit Number Recognition (In Progress)
  - Level 8: Simple Two-digit Addition (In Progress)
  - Level 9: Fun with Multiplication (In Progress)
  - Level 10: Basic Division - Sharing (In Progress)

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
- **Interactive Learning** - Click-based games with instant feedback
- **Unified Game Experience** - All Iqra lessons (1-9) now use interactive game format (NEW!)
- **English Instructions** - All UI text in English with Arabic translations (NEW!)
- **Hidden Answer Logic** - Math answers revealed only after correct submission
- **Visual Feedback** - Animations and sounds for engagement
- **Progress Tracking** - Score tracking, retry wrong answers, and completion celebrations
- **Age-Appropriate Content** - Tailored for children ages 3-9
- **Multi-language** - Supports English, Malay, and Arabic
- **Offline Ready** - No external dependencies required
- **Security Hardened** - CSP, rate limiting, and security headers
- **Performance Optimized** - Gzip compression and asset caching

## 📘 Documentation

- [Iqra Lesson Expansion Guide](IQRA_LESSON_GUIDE.md) - Lesson structure and scope

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
    ├── iqra/              # Arabic reading lessons
    │   ├── iqra1.html     # Iqra 1: Basic letters
    │   ├── iqra2.html     # Iqra 2: Harakat with letters
    │   ├── iqra3.html     # Iqra 3: Word formation
    │   ├── iqra4.html     # Iqra 4: Three-letter words
    │   ├── iqra5.html     # Iqra 5: All 28 letter forms by position
    │   ├── iqra6.html     # Iqra 6: Blending and short words
    │   ├── iqra7.html     # Iqra 7: Sukun and Shaddah
    │   ├── iqra8.html     # Iqra 8: Tanween and long vowels
    │   └── iqra9.html     # Iqra 9: Quranic reading with tajweed
    └── math/              # Math learning module (NEW!)
        ├── math1.html     # Level 1: Number Recognition
        ├── math2.html     # Level 2: Addition within 5
        ├── math3.html     # Level 3: Subtraction within 5
        ├── math4.html     # Level 4: Bigger vs Smaller
        ├── math5.html     # Level 5: Addition within 10
        ├── math6.html     # Level 6: Subtraction within 10
        ├── math7.html     # Level 7: Two-digit Numbers
        ├── math8.html     # Level 8: Two-digit Addition
        ├── math9.html     # Level 9: Multiplication
        └── math10.html    # Level 10: Division (Sharing)
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
