#!/bin/bash

# XKids Learning Center - Docker Deployment Script
# Made with ❤️ by Exrienz

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Project configuration
PROJECT_NAME="xkids-learning-center"
IMAGE_NAME="xkids-learning-center:latest"
CONTAINER_NAME="xkids-learning-center"
PORT="8080"

# Helper functions
print_header() {
    echo -e "\n${BLUE}🌟 XKids Learning Center - Docker Deployment${NC}"
    echo -e "${BLUE}================================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if Docker is installed and running
check_docker() {
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed. Please install Docker first."
        exit 1
    fi
    
    if ! docker info &> /dev/null; then
        print_error "Docker is not running. Please start Docker first."
        exit 1
    fi
    
    print_success "Docker is installed and running"
}

# Check if Docker Compose is available
check_docker_compose() {
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        print_error "Docker Compose is not installed. Please install Docker Compose first."
        exit 1
    fi
    
    print_success "Docker Compose is available"
}

# Function to build the Docker image
build_image() {
    print_info "Building Docker image..."
    
    if docker build -t $IMAGE_NAME .; then
        print_success "Docker image built successfully"
        
        # Show image info
        echo -e "\n${BLUE}Image Information:${NC}"
        docker images | grep xkids-learning-center | head -1
    else
        print_error "Failed to build Docker image"
        exit 1
    fi
}

# Function to run with Docker Compose
run_compose() {
    print_info "Starting application with Docker Compose..."
    
    if docker-compose up -d; then
        print_success "Application started successfully"
        print_info "Application is available at: http://localhost:$PORT"
        
        # Wait for health check
        print_info "Waiting for application to be ready..."
        sleep 10
        
        # Check health
        if curl -f http://localhost:$PORT/health &> /dev/null; then
            print_success "Application is healthy and ready!"
        else
            print_warning "Application started but health check failed. Check logs with: docker-compose logs"
        fi
    else
        print_error "Failed to start application"
        exit 1
    fi
}

# Function to run simple container
run_simple() {
    print_info "Starting simple Docker container..."
    
    # Stop existing container if running
    if docker ps -q -f name=$CONTAINER_NAME | grep -q .; then
        print_warning "Stopping existing container..."
        docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
    fi
    
    if docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME; then
        print_success "Container started successfully"
        print_info "Application is available at: http://localhost:$PORT"
        
        # Wait and check health
        print_info "Waiting for application to be ready..."
        sleep 10
        
        if curl -f http://localhost:$PORT/health &> /dev/null; then
            print_success "Application is healthy and ready!"
        else
            print_warning "Application started but health check failed. Check logs with: docker logs $CONTAINER_NAME"
        fi
    else
        print_error "Failed to start container"
        exit 1
    fi
}

# Function to stop application
stop_app() {
    print_info "Stopping application..."
    
    # Try Docker Compose first
    if [ -f "docker-compose.yml" ]; then
        docker-compose down
        print_success "Docker Compose services stopped"
    fi
    
    # Stop simple container if exists
    if docker ps -q -f name=$CONTAINER_NAME | grep -q .; then
        docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
        print_success "Container stopped and removed"
    fi
    
    print_success "Application stopped successfully"
}

# Function to show logs
show_logs() {
    print_info "Showing application logs..."
    
    if [ -f "docker-compose.yml" ] && docker-compose ps | grep -q "Up"; then
        docker-compose logs -f --tail=50
    elif docker ps -q -f name=$CONTAINER_NAME | grep -q .; then
        docker logs -f --tail=50 $CONTAINER_NAME
    else
        print_warning "No running containers found"
    fi
}

# Function to show status
show_status() {
    print_info "Application Status:"
    echo ""
    
    # Check Docker Compose services
    if [ -f "docker-compose.yml" ]; then
        echo -e "${BLUE}Docker Compose Services:${NC}"
        docker-compose ps
        echo ""
    fi
    
    # Check simple container
    if docker ps -a -f name=$CONTAINER_NAME | grep -q $CONTAINER_NAME; then
        echo -e "${BLUE}Simple Container:${NC}"
        docker ps -a -f name=$CONTAINER_NAME
        echo ""
    fi
    
    # Check if application is accessible
    if curl -f http://localhost:$PORT/health &> /dev/null; then
        print_success "Application is running and healthy at http://localhost:$PORT"
    else
        print_warning "Application is not accessible or not healthy"
    fi
}

# Function to clean up
cleanup() {
    print_info "Cleaning up Docker resources..."
    
    # Stop and remove containers
    stop_app
    
    # Remove images
    if docker images -q $IMAGE_NAME | grep -q .; then
        docker rmi $IMAGE_NAME
        print_success "Docker image removed"
    fi
    
    # Clean up unused resources
    docker system prune -f
    print_success "Docker cleanup completed"
}

# Function to open application
open_app() {
    if command -v open &> /dev/null; then
        open http://localhost:$PORT
    elif command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:$PORT
    else
        print_info "Please open http://localhost:$PORT in your browser"
    fi
}

# Function to show help
show_help() {
    echo -e "${BLUE}XKids Learning Center - Docker Deployment Script${NC}"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  build      Build Docker image"
    echo "  start      Start application with Docker Compose"
    echo "  simple     Start simple Docker container"
    echo "  stop       Stop application"
    echo "  restart    Restart application"
    echo "  logs       Show application logs"
    echo "  status     Show application status"
    echo "  open       Open application in browser"
    echo "  cleanup    Clean up all Docker resources"
    echo "  help       Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 build && $0 start    # Build and start with Docker Compose"
    echo "  $0 simple               # Quick start with simple container"
    echo "  $0 logs                 # View logs"
    echo "  $0 cleanup              # Clean up everything"
}

# Main script logic
main() {
    print_header
    
    case "${1:-help}" in
        "build")
            check_docker
            build_image
            ;;
        "start")
            check_docker
            check_docker_compose
            build_image
            run_compose
            ;;
        "simple")
            check_docker
            build_image
            run_simple
            ;;
        "stop")
            check_docker
            stop_app
            ;;
        "restart")
            check_docker
            stop_app
            sleep 2
            if [ -f "docker-compose.yml" ]; then
                run_compose
            else
                run_simple
            fi
            ;;
        "logs")
            check_docker
            show_logs
            ;;
        "status")
            check_docker
            show_status
            ;;
        "open")
            open_app
            ;;
        "cleanup")
            check_docker
            cleanup
            ;;
        "help"|"-h"|"--help")
            show_help
            ;;
        *)
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"