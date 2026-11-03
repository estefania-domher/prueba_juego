# Pruebas de T2.2

## Alcance
Se documentan las comprobaciones de la práctica: reutilización de la escena Player desde Main, movimiento, señal de interacción y fin de ronda con `RoundTimer`.

## Pruebas realizadas

| Comprobación | Resultado |
|---|---|
| Revisión estática de `project.godot`, scripts y escenas | Correcto: Main instancia `scenes/dragon.tscn` como `Player`; el script hereda de `CharacterBody2D` y usa `move_and_slide()`. |
| Conexión de `interact_requested` | Correcto en el código: Main conecta la señal del Player en `_ready()` con `_on_player_interact_requested()`. |
| Fin de ronda | Correcto en el código: el temporizador de una sola ejecución llama a `stop_player()` al emitir `timeout`; el jugador deja de procesar movimiento. |
| Ejecución dentro de Godot | No realizada: no se encontró el ejecutable de Godot en las ubicaciones habituales ni en el `PATH` de este equipo. |

## Pasos para verificación manual
1. Abrir el proyecto en Godot y ejecutar la escena principal.
2. Mantener pulsadas las flechas izquierda/derecha: el jugador debe moverse horizontalmente.
3. Pulsar `E`: la consola debe mostrar `Main: señal interact_requested recibida.`
4. Esperar diez segundos: la consola debe indicar el fin de `RoundTimer`; después, el jugador debe permanecer inmóvil.

## Notas
`interact` está asignada a `E` en el mapa de entrada. `RoundTimer` está configurado como `one_shot` y `autostart`, con una duración de diez segundos. Estas pruebas de comportamiento están descritas para verificación manual; no se afirma que hayan sido ejecutadas sin Godot disponible.
