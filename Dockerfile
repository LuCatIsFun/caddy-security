ARG CADDY_VERSION=2.11.7
ARG SECURITY_VERSION=""

FROM caddy:${CADDY_VERSION}-builder AS builder
ARG SECURITY_VERSION
RUN xcaddy build \
    --with github.com/greenpau/caddy-security${SECURITY_VERSION:+@${SECURITY_VERSION}}

FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
