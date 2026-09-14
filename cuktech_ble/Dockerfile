ARG BUILD_FROM
FROM ${BUILD_FROM}

# BlueZ (Client-Tools, damit bleak/BlueZ-D-Bus sauber funktioniert),
# Python + Git zum Ziehen des Servers
RUN apk add --no-cache \
        python3 \
        py3-pip \
        git \
        bluez \
        bluez-btmon \
        dbus

# Temporaer: Fork mit Zombie-BLE-Channel-Fix, bis PR #5 upstream gemerged ist
# https://github.com/kairui1108/cuktech-ble-server/pull/5
ARG CUKTECH_REPO=https://github.com/merfu/cuktech-ble-server.git
ARG CUKTECH_REF=merfu-patch-1
WORKDIR /app

RUN git clone --depth 1 --branch ${CUKTECH_REF} \
        ${CUKTECH_REPO} /app \
    && pip install --no-cache-dir --break-system-packages -e .

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
