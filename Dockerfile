FROM debian:bullseye-slim
ENV RUST_LOG=info
ENV APP_USER=rustuser
RUN useradd -m -d /home/${APP_USER} -s /bin/bash ${APP_USER}
WORKDIR /app
COPY release-artifacts/runtime-stable /app/runtime-stable
RUN chown ${APP_USER}:${APP_USER} /app/runtime-stable && \
    chmod +x /app/runtime-stable

USER ${APP_USER}
ENTRYPOINT ["/app/runtime-stable"]