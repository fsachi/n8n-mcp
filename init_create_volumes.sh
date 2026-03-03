#!/bin/bash

# Lista de volúmenes necesarios definidos en docker-compose.yml
VOLUMES=("n8n_data" "n8n_mcp_data" "portainer_data")

echo "🔍 Verificando volúmenes de Docker..."

for VOL in "${VOLUMES[@]}"; do
    # Verifica si el volumen existe
    if docker volume inspect "$VOL" > /dev/null 2>&1; then
        echo "✅ El volumen '$VOL' ya existe."
    else
        echo "⚠️ El volumen '$VOL' no existe. Creándolo..."
        docker volume create "$VOL"
        if [ $? -eq 0 ]; then
            echo "✅ Volumen '$VOL' creado exitosamente."
        else
            echo "❌ Error al crear el volumen '$VOL'."
        fi
    fi
done

echo "🎉 Verificación de volúmenes completada."
