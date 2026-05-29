FROM vlang/vlang:latest AS build
WORKDIR /app
COPY . .
RUN v -prod -o /contestops-api cmd/contestops-api

FROM debian:bookworm-slim
RUN useradd -r -u 10001 contestops
COPY --from=build /contestops-api /usr/local/bin/contestops-api
USER contestops
ENV PORT=8080
EXPOSE 8080
CMD ["contestops-api"]
