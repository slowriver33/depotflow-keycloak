# NOTE: KC_VERSION is pinned to 26.0 — the assumed version on Railway abundant-embrace.
# James: please verify via Keycloak admin → Support → Server info → Server version
# and update this ARG if it differs.
ARG KC_VERSION=26.0

FROM quay.io/keycloak/keycloak:${KC_VERSION} AS builder

ENV KC_DB=postgres
ENV KC_FEATURES=token-exchange,admin-fine-grained-authz

COPY themes/depotflow/ /opt/keycloak/themes/depotflow/

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:${KC_VERSION}
COPY --from=builder /opt/keycloak/ /opt/keycloak/

WORKDIR /opt/keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
