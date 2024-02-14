ARG DEBIAN_FRONTEND=noninteractive
FROM docker.io/steamcmd/steamcmd:ubuntu

ENV SERVER_NAME="Rusty"

EXPOSE 28015
EXPOSE 28016


# Setup default environment variables for the server
ENV RUST_SERVER_STARTUP_ARGUMENTS "-batchmode -load -nographics +server.secure 1"
ENV RUST_SERVER_IDENTITY "rusty"
ENV RUST_SERVER_PORT "28015"
ENV RUST_SERVER_QUERYPORT ""
ENV RUST_SERVER_SEED "793197"
ENV RUST_SERVER_NAME "Rusty"
ENV RUST_SERVER_DESCRIPTION "This is a Rust server running inside a container!"
ENV RUST_SERVER_URL ""
ENV RUST_SERVER_BANNER_URL ""
ENV RUST_SERVER_TICKRATE 10
ENV RUST_RCON_WEB "1"
ENV RUST_RCON_PORT "28016"
ENV RUST_RCON_PASSWORD "very-secret"
ENV RUST_APP_PORT "28082"
ENV RUST_UPDATE_CHECKING "0"
ENV RUST_HEARTBEAT "0"
ENV RUST_UPDATE_BRANCH "public"
ENV RUST_START_MODE "0"
ENV RUST_OXIDE_ENABLED "0"
ENV RUST_OXIDE_UPDATE_ON_BOOT "1"
ENV RUST_RCON_SECURE_WEBSOCKET "0"
ENV RUST_SERVER_WORLDSIZE "3500"
ENV RUST_SERVER_MAXPLAYERS "500"
ENV RUST_SERVER_SAVE_INTERVAL "600"


RUN apt -y update && apt -y upgrade; \
	apt -y install libsqlite3-0 libsqlite3-dev libarchive-tools curl; \
	mkdir /app;

COPY /app/entrypoint.sh /app/entrypoint.sh
COPY /app/oxide-install.sh /app/oxide-install.sh
COPY /app/install.txt /app/install.txt
RUN chmod +x /app/entrypoint.sh;

ENTRYPOINT ["/app/entrypoint.sh"]
