#!/usr/bin/env bash
set -euo pipefail

log() {
  local level="$1"; shift
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [${level}] $*"
}

on_exit() {
  local status=$?
  if [ "${status}" -ne 0 ]; then
    log "ERROR" "deploy.sh terminó con código ${status}"
  fi
  exit "${status}"
}
trap on_exit EXIT

if ! command -v docker >/dev/null 2>&1; then
  log "ERROR" "docker no está instalado o no está en PATH"
  exit 1
fi

log "INFO" "Construyendo imagen..."
if ! docker compose build; then
  log "ERROR" "Falló el build de docker compose"
  exit 2
fi

log "INFO" "Levantando servicio..."
docker compose up -d --remove-orphans

log "INFO" "Limpiando imágenes viejas sin usar..."
docker image prune -f

log "INFO" "Deploy completado correctamente"
