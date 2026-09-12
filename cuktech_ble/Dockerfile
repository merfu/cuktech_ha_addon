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

ARG CUKTECH_REF=main
WORKDIR /app

# Bestehendes Projekt 1:1 uebernehmen, keine eigene Kopie pflegen
RUN git clone --depth 1 --branch ${CUKTECH_REF} \
        https://github.com/kairui1108/cuktech-ble-server.git /app \
    && pip install --no-cache-dir --break-system-packages -e .

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
