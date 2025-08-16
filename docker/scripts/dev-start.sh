#!/bin/bash

# XKids Learning Center - Development Start Script
# This script starts the application in development mode with file watching

set -e

echo "🚀 Starting XKids Learning Center in Development Mode..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

# Build the development image
echo "🔨 Building Docker development image..."
docker-compose build xkids-dev

# Start development services
echo "🌟 Starting development services..."
docker-compose --profile development up -d

# Wait for services to be healthy
echo "⏳ Waiting for services to be ready..."
sleep 5

# Check if the development service is running
if docker ps | grep -q xkids-learning-center-dev; then
    echo "✅ XKids Learning Center is running successfully in development mode!"
    echo ""
    echo "📱 Access the application at: http://localhost:8080"
    echo "📊 View logs at: http://localhost:8081"
    echo ""
    echo "🔧 Development features:"
    echo "  - File watching enabled (changes to src/ will be reflected immediately)"
    echo "  - Live reload on file changes"
    echo "  - Log monitoring available at port 8081"
    echo ""
    echo "🛑 To stop: docker-compose --profile development down"
else
    echo "❌ Failed to start development services. Checking logs..."
    docker-compose --profile development logs
    exit 1
fi