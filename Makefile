.PHONY: build run stop push clean

IMAGE_NAME := go-sec-kill
TAG := latest

build:
	@echo "检查是否存同名 Docker 镜像并删除"
	@docker rmi $(IMAGE_NAME):$(TAG) || true
	@echo "正在构建 Docker 镜像..."
	docker build -t $(IMAGE_NAME):$(TAG) -f ./deploy/Dockerfile .

run:
	@echo "正在运行 Docker 容器..."
	docker run -d --name $(IMAGE_NAME) $(IMAGE_NAME):$(TAG)

stop:
	@echo "正在停止 Docker 容器..."
	docker stop $(IMAGE_NAME)
	docker rm $(IMAGE_NAME)

push:
	@echo "正在推送 Docker 镜像到仓库..."
	docker push $(IMAGE_NAME):$(TAG)

clean:
	@echo "正在清理 Docker 镜像和容器..."
	docker rmi $(IMAGE_NAME):$(TAG)
