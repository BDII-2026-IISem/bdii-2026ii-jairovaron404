#!/bin/bash
set -e

BASE="$HOME/ia-lab/services/motores-bd"

echo "========================================"
echo "Deteniendo motores de base de datos..."
echo "========================================"

for dir in mysql postgres mssql oracle; do
    echo ""
    echo ">>> Deteniendo $dir..."

    cd "$BASE/$dir"

    sudo docker compose down

    echo "    $dir: OK"
done

echo ""
echo "========================================"
echo "Todos los motores detenidos."
echo "========================================"
