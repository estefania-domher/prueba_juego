# Pruebas del prototipo

## Mecánica
Mover al dragón con las flechas y pulsar E para lanzar fuego. Main cuenta cada interacción. RoundTimer termina la ronda a los 60 segundos y detiene al jugador.

## Comprobaciones
| Prueba | Resultado |
|---|---|
| Movimiento con flechas | Godot headless comprobó movimiento a la izquierda. |
| Señal al pulsar E | `Player` emite `interact_requested`; `Main` recibe la señal y aumenta el contador. |
| Fin del tiempo | `RoundTimer.timeout` llega a Main y detiene al jugador. |
| Build Windows | El `.exe` se abrió fuera del editor en modo headless y completó 120 frames. |

Para probarlo visualmente, ejecuta el proyecto con F5, mueve el dragón, pulsa E y espera al final del minuto. La build está en `build/windows/ElBosqueDelDragon.exe`; necesita el `.pck` del mismo nombre en esa carpeta.

## Depuración y matemáticas
El controlador usa `CharacterBody2D` con `Vector2` y `move_and_slide()`. `lerp_angle` gira el dragón suavemente hacia su dirección de movimiento. Se corrigió el controlador previo que llamaba a `move_and_slide()` desde un `Sprite2D`.

## Exportación
Hay presets Windows Desktop y Linux Desktop para comparar. La build Windows se exportó y arrancó fuera del editor. El preset Linux queda preparado, pero no se exportó.
