# Dragón

Prototipo 2D básico hecho con Godot 4. El dragón puede volar durante un minuto. Pulsa **E** para lanzar fuego; la pantalla cuenta las interacciones. Al terminar el tiempo, el dragón se detiene.

## Controles
- Flechas: mover al dragón.
- E: lanzar fuego y aumentar el contador.

## Ejecutar
Abre esta carpeta en Godot y pulsa **F5**. La escena principal es `scenes/main.tscn`.

## Scripts y señales
- `scripts/dragon.gd`: mueve y gira al dragón; emite `interact_requested` al pulsar E.
- `scripts/main.gd`: recibe esa señal, actualiza el contador y conecta `RoundTimer.timeout` para detener al jugador.

La configuración contiene presets Windows Desktop y Linux Desktop. Las pruebas y los resultados de exportación están en `docs/pruebas.md`.
