# 第一阶段: 构建阶段
FROM golang:1.22.2-alpine AS builder
WORKDIR /app

# 复制整个项目代码
COPY . .

ENV GOPROXY=https://goproxy.cn,direct

# 下载依赖并构建应用
RUN go mod download
RUN go build -o main .

# 第二阶段: 运行阶段
FROM alpine:latest
WORKDIR /app

# 从构建器复制可执行文件
COPY --from=builder /app/main /app/main

# 设置启动命令
ENTRYPOINT ["/app/main"]
