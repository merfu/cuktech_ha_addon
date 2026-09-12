# CUKTECH BLE Server - Add-on

Verpackt den Server aus [kairui1108/cuktech-ble-server](https://github.com/kairui1108/cuktech-ble-server)
als Home Assistant Supervisor-Add-on. Der Python-Code wird beim Build unveraendert
aus dem Original-Repo geklont - hier kommt nur die Supervisor-Integration
(Konfigurationsformular, Bluetooth-/Netzwerkrechte, Start/Stop/Watchdog) dazu.

## Konfiguration

| Option           | Pflicht | Beschreibung                                              |
| ----------------- | ------- | ---------------------------------------------------------- |
| ble_mac           | ja      | MAC-Adresse des CUKTECH-Ladegeraets                          |
| ble_token         | nein    | Xiaomi-Cloud-Token (aus bestehender Config oder Extractor)  |
| ble_key           | nein    | BLE-Verschluesselungs-Key                                    |
| mqtt_host         | ja*     | MQTT-Broker-Host (z. B. core-mosquitto, wenn du den HA-eigenen Broker nutzt) |
| mqtt_port         | ja      | MQTT-Port, Standard 1883                                    |
| mqtt_user         | nein    | MQTT-Benutzer                                               |
| mqtt_password     | nein    | MQTT-Passwort                                               |
| server_port       | ja      | Port der Web-UI, Standard 8199                              |
| bemfa_uid         | nein    | Bafa-Cloud UID fuer Xiao-Ai/Xiaodu-Sprachsteuerung           |
| log_level         | nein    | debug/info/warning/error                                    |

\* Leer lassen deaktiviert MQTT.

## Zugriff

- Web-UI: http://<HA-IP>:8199/
- Konfigseite: http://<HA-IP>:8199/config.html

## Voraussetzungen

- Bluetooth-Adapter am HA-Host (das Add-on nutzt den Host-D-Bus/BlueZ direkt,
  daher host_dbus: true und host_network: true)
