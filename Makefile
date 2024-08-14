.PHONY: build run stop clean

IMAGE_NAME := smcroot/go-sec-kill
TAG := latest
CONTAINER_NAME := go-sec-kill

build:
	@echo "检查是否存在同名 Docker 镜像并删除"
	docker rmi $(IMAGE_NAME):$(TAG)
	@echo "正在构建 Docker 镜像..."
	docker build -t $(IMAGE_NAME):$(TAG) -f ./deploy/Dockerfile .

run:
	@echo "正在运行 Docker 容器..."
	docker run -d --name $(CONTAINER_NAME) $(IMAGE_NAME):$(TAG)

stop:
	@echo "正在停止 Docker 容器..."
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

clean:
	@echo "正在清理 Docker 镜像和容器..."
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME):$(TAG)
