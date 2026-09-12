# cuktech_ha_addon

Home Assistant Add-on-Repository fuer den CUKTECH 10 GaN Charger Ultra BLE Server (https://github.com/kairui1108/cuktech-ble-server).

## Installation

1. In Home Assistant: Einstellungen -> Add-ons -> Add-on Store
2. Oben rechts auf die drei Punkte -> Repositories
3. URL einfuegen: https://github.com/merfu/cuktech_ha_addon
4. Das Add-on "CUKTECH BLE Server" erscheint im Store -> installieren
5. Konfiguration ausfuellen (siehe cuktech_ble/DOCS.md), starten

## Struktur

repository.yaml       Repo-Metadaten fuer den Add-on-Store
cuktech_ble/
  config.yaml          Add-on-Metadaten + Optionen-Schema
  build.yaml           Basis-Images je Architektur
  Dockerfile           Klont/installiert kairui1108/cuktech-ble-server
  run.sh               Schreibt Optionen -> config.yaml, startet den Server
  DOCS.md              Dokumentation (in der Add-on-UI sichtbar)
  CHANGELOG.md         Aenderungen (in der Add-on-UI sichtbar)
