BACKEND_DIR = backend
FRONTEND_DIR = frontend

.PHONY: up
up: 
	pnpm install --dir ${BACKEND_DIR} && \
	docker-compose -f docker-compose.yaml up --build -d && \
	pnpm install --dir ${FRONTEND_DIR} && \
	docker-compose -f docker-compose.yaml up --build -d

.PHONY: down
down:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml down
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml down

.PHONY: build
build:
	pnpm install --dir ${BACKEND_DIR} && \
	docker-compose -f docker-compose.yaml build && \
	pnpm install --dir ${FRONTEND_DIR} && \
	docker-compose -f docker-compose.yaml build

.PHONY: backend-up
backend-up:
	pnpm install --dir ${BACKEND_DIR} && \
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml up --build -d

.PHONY: backend-down
backend-down:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml down

.PHONY: backend-build
backend-build:
	pnpm install --dir ${BACKEND_DIR} && \
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml build

.PHONY: backend-logs
backend-logs:
	docker-compose -f ${BACKEND_DIR}/docker-compose.yaml logs

.PHONY: frontend-up
frontend-up:
	pnpm install --dir ${FRONTEND_DIR} && \
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml up --build -d

.PHONY: frontend-down
frontend-down:
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml down

.PHONY: frontend-build
frontend-build:
	pnpm install --dir ${FRONTEND_DIR} && \
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml build

.PHONY: frontend-logs
frontend-logs:
	docker-compose -f ${FRONTEND_DIR}/docker-compose.yaml logs

.PHONY: clear-all
clear-all:
	@echo "Cleaning up Docker..."
	@docker builder prune -f
	@docker system prune -a -f --volumes
	@docker volume rm backend_postgres_data
	@echo "Docker cleanup completed."