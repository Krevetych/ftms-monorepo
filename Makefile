BACKEND_DIR = backend
FRONTEND_DIR = frontend

.PHONY: up
up: 
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml up -d
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml up -d

.PHONY: down
down:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml down
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml down

.PHONY: build
build:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml build
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml build

.PHONY: backend-up
backend-up:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml up -d

.PHONY: backend-down
backend-down:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml down

.PHONY: backend-build
backend-build:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml build

.PHONY: backend-logs
backend-logs:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml logs

.PHONY: frontend-up
frontend-up:
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml up -d

.PHONY: frontend-down
frontend-down:
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml down

.PHONY: frontend-build
frontend-build:
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml build

.PHONY: frontend-logs
frontend-logs:
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml logs

.PHONY: clear-all
clean-all:
	@echo "Cleaning up Docker..."
	@docker builder prune -f
	@docker system prune -a -f --volumes
	@docker volume rm backend_postgres_data
	@echo "Docker cleanup completed."