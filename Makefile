.PHONY: help build_backend run_backend run_docker_compose clean

# Show available commands
help:
	@echo "Available commands:"
	@echo "  make up-dev         - Start the development environment"
	@echo "  make up-prod        - Start the production environment in detached mode"
	@echo "  make logs-prod      - View logs for the production environment"
	@echo "  make down-dev       - Stop and remove containers in development"
	@echo "  make down-prod      - Stop and remove containers in production"
	@echo "  make clean          - Remove Docker containers and images"

# Run for Development (it uses docker-compose.override.yml for dev)
up-dev:
	docker compose up --build

# Run for Production (without override) in detached mode
up-prod:
	docker compose -f docker-compose.yml up --build -d

# View logs for Production
logs-prod:
	docker compose -f docker-compose.yml logs -f

# Stop and remove all containers for Development
down-dev:
	docker compose down

# Stop and remove all containers for Production
down-prod:
	docker compose -f docker-compose.yml down

# Clean up Docker containers and images
clean:
	docker system prune -f
