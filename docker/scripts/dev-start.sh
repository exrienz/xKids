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

# Build the image
echo "🔨 Building Docker image..."
docker-compose build xkids-app

# Start development services
echo "🌟 Starting development services..."
docker-compose --profile development up -d

# Wait for services to be healthy
echo "⏳ Waiting for services to be ready..."
sleep 10

# Check if the main service is healthy
if docker exec xkids-learning-center /usr/local/bin/healthcheck.sh > /dev/null 2>&1; then
    echo "✅ XKids Learning Center is running successfully!"
    echo ""
    echo "📱 Access the application at: http://localhost:8080"
    echo "📊 View logs at: http://localhost:8081"
    echo ""
    echo "🔧 Development features:"
    echo "  - Auto file watching enabled"
    echo "  - Live reload on file changes"
    echo "  - Log monitoring available"
    echo ""
    echo "🛑 To stop: docker-compose --profile development down"
else
    echo "❌ Health check failed. Checking logs..."
    docker-compose logs xkids-app
    exit 1
fi