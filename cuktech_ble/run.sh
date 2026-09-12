#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/config.yaml

bashio::log.info "Schreibe Konfiguration aus den Add-on-Optionen nach ${CONFIG_PATH} ..."

MQTT_ENABLED="false"
if bashio::config.has_value 'mqtt_host'; then
    MQTT_ENABLED="true"
fi

cat > "${CONFIG_PATH}" <<EOF
ble:
  mac: "$(bashio::config 'ble_mac')"
  token: "$(bashio::config 'ble_token' '')"
  ble_key: "$(bashio::config 'ble_key' '')"
mqtt:
  enabled: ${MQTT_ENABLED}
  host: "$(bashio::config 'mqtt_host' '')"
  port: $(bashio::config 'mqtt_port')
  username: "$(bashio::config 'mqtt_user' '')"
  password: "$(bashio::config 'mqtt_password' '')"
server:
  port: $(bashio::config 'server_port')
  settings_refresh_interval: 10.0
bemfa:
  uid: "$(bashio::config 'bemfa_uid' '')"
EOF

export CUKTECH_CONFIG_PATH="${CONFIG_PATH}"
export CUKTECH_HISTORY_DB_PATH="/data/port_history.db"
export CUKTECH_LOG_LEVEL="$(bashio::config 'log_level')"

bashio::log.info "Starte CUKTECH BLE Server auf Port $(bashio::config 'server_port') ..."
cd /app
exec python3 ha_server.py
