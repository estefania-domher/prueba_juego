# Registro de Pruebas de Build
 
## Información del Entorno
- **Motor:** Godot Engine 4.x
- **Plataforma objetivo:** Windows Desktop
- **Ruta de exportación:** `build/prueba_juego.exe` (fuera del código fuente)
 
## Prueba Realizada
- **Acción:** Ejecución autónoma del binario `prueba_juego.exe` con el editor de Godot cerrado.
- **Resultado:** Éxito. La ventana del juego carga correctamente la escena principal `main.tscn` con los recursos gráficos y la cámara sin fallos.
 
## Reproducibilidad
1. Clonar el repositorio desde GitHub.
2. Abrir el proyecto en Godot Engine.
3. Ir a Proyecto -> Exportar.
4. Seleccionar el ajuste preestablecido Windows Desktop y pulsar en Exportar Proyecto a una carpeta externa `build/`.
