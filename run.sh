#!/usr/bin/env bash
set -euo pipefail
command -v java >/dev/null || { echo "Install JDK 17+ first."; exit 1; }
command -v mvn >/dev/null || { echo "Install Maven 3.8+ first."; exit 1; }
if [[ -z "${INITIAL_ADMIN_PASSWORD:-}" ]]; then
  read -rsp "Enter a strong initial placement-officer password: " INITIAL_ADMIN_PASSWORD
  echo
  export INITIAL_ADMIN_PASSWORD
fi
export INITIAL_ADMIN_EMAIL="${INITIAL_ADMIN_EMAIL:-officer@driems.ac.in}"
mvn spring-boot:run
