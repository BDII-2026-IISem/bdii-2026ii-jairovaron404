#!/bin/bash
set -e

BASE="$HOME/ia-lab/services/motores-bd"

echo "========================================"
echo "Iniciando motores de base de datos..."
echo "========================================"

for dir in mysql postgres mssql oracle; do
    echo ""
    echo ">>> Levantando $dir..."

    cd "$BASE/$dir"

    sudo docker compose up -d

    echo "    $dir: OK"
done

echo ""
echo "========================================"
echo "Todos los motores iniciados."
echo "========================================"
