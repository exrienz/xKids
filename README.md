# 🌟 XKids Learning Center

Educational web applications for children to learn Malaysian and Arabic reading skills.

## 📱 Applications

- **Malaysian Reading (Belajar Membaca)** - Interactive syllable-based learning
- **Arabic Reading (Iqra 1-4)** - Traditional Islamic reading curriculum

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

## 🔧 Technical Details

- **Base Image**: nginx:alpine
- **Port**: 80 (mapped to 8080 on host)
- **Size**: ~50MB (optimized)
- **Architecture**: Multi-platform support

## 📄 Files Included

- `index.html` - Main landing page
- `malay1.html`, `malay2.html` - Malaysian reading lessons
- `iqra1.html` to `iqra4.html` - Arabic reading lessons
- `CLAUDE.md` - Development documentation

## 👨‍💻 Created by

**Made with ❤️ by [Exrienz](https://www.linkedin.com/in/muzaffarmohamed/?originalSubdomain=my)**