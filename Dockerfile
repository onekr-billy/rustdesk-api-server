FROM golang:1.19 as builder
WORKDIR /project
ADD . .
RUN make build


FROM alpine
RUN mkdir /app

# 复制配置文件
COPY conf /app/conf

# 复制主文件
COPY rustdesk-api-server /app
WORKDIR /app
ENTRYPOINT ["./rustdesk-api-server"]

# 导出端口号
EXPOSE [21114]