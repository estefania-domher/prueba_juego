# Registro de pruebas - T2.2 y T2.3

## Proyecto
El Bosque del Dragón, Godot 4.7.2, prototipo 2D para Windows Desktop. La escena de juego ya no instancia el esqueleto: el personaje controlable es el dragón.

## Mecánica y controles
- Flechas: mover al dragón en horizontal y vertical.
- E: recoger el árbol más cercano si está a 92 px o menos.
- Objetivo: recoger 3 árboles antes de que el temporizador de 60 s llegue a cero.
- El HUD enseña árboles recogidos, segundos restantes, distancia al árbol más cercano y el estado de interacción.

## Comprobaciones de código realizadas
| Comprobación | Resultado |
|---|---|
| `Main` instancia `scenes/dragon.tscn` y tres instancias de `scenes/arbol.tscn` | Revisado en `scenes/main.tscn`. No se referencia `BODY_skeleton.png` desde la escena principal. |
| Movimiento, límites y orientación | `scripts/dragon.gd` usa `Input.get_vector`, `CharacterBody2D.move_and_slide`, límites de pantalla y `lerp_angle` para orientar el dragón gradualmente. |
| Regla de proximidad | `scripts/main.gd` calcula `distance_to` entre el dragón y cada árbol; solo recoge el más cercano a 92 px o menos. El HUD muestra ese valor en píxeles. |
| Señales y orden | Player emite `interact_requested`; Main la recibe y pide recoger. El árbol emite `collected`; Main actualiza el marcador. `RoundTimer.timeout` termina la ronda y detiene al jugador. |
| Movimiento visual del árbol | `scripts/arbol.gd` suaviza el vaivén con `move_toward` y `sin`. |
| Estado final | Tres árboles recogidos muestran victoria; el temporizador agotado muestra fin de ronda. Ambos detienen movimiento y tiempo. |

## Pruebas ejecutadas en Godot 4.7.2
La escena se importó y ejecutó en modo headless en una copia temporal escribible. Pasaron las comprobaciones automáticas de carga de Main, movimiento a la izquierda, rechazo de una recogida fuera del alcance, recogida de los tres árboles mediante `interact_requested`, victoria, timeout y detención del dragón. No aparecieron errores del proyecto en la salida de ejecución. El entorno mostró un aviso independiente al leer certificados raíz.

La captura de la ejecución gráfica de T2.2 había mostrado antes el movimiento, `interact_requested` y la detención al finalizar el tiempo. Tras implementar T2.3, queda pendiente repetir en la interfaz gráfica estas pruebas visuales:

1. Ejecutar el proyecto y confirmar que aparece el dragón y no aparece el esqueleto.
2. Probar las cuatro flechas; observar que el dragón se orienta gradualmente hacia el movimiento.
3. Alejarse de un árbol y pulsar E: no debe aumentar el marcador.
4. Acercarse a un árbol hasta que la distancia del HUD sea 92 px o menor y pulsar E: el árbol desaparece y el marcador sube en uno.
5. Recoger los tres árboles: aparece victoria y el dragón deja de moverse.
6. Iniciar otra ronda y esperar 60 segundos: aparece el mensaje de tiempo agotado y el dragón se detiene.
7. Revisar la consola de Godot y el panel Depurador; no deben aparecer errores.

## Build y presets
Godot 4.7.2 reconoce los presets Windows Desktop y Linux Desktop.

| Plataforma | Resultado |
|---|---|
| Windows Desktop x86_64 | Build de release exportada, copiada a `build/windows` y probada con el editor cerrado. El `.exe` independiente arrancó en modo headless y completó 120 frames con código de salida 0. La mecánica se comprobó en Godot headless antes de exportar. |
| Linux Desktop x86_64 | Preset reconocido por Godot. La exportación no se realizó porque no se instalaron las plantillas Linux. |

Se obtuvieron del servidor oficial solo las plantillas Windows de Godot 4.7.2 necesarias para producir la build. La verificación gráfica de la mecánica en la build queda pendiente; el arranque independiente sí se comprobó.

## Depuración
Se corrigió el controlador previo: intentaba usar `velocity` y `move_and_slide()` en un `Sprite2D`. El jugador ahora es `CharacterBody2D`, que proporciona el movimiento físico esperado. Para depurar la regla de recogida se expone en el HUD la distancia calculada al objetivo más cercano.

## Comparación de presets
| Destino | Preset | Uso y requisitos |
|---|---|---|
| Windows Desktop | Principal para la entrega | Genera un `.exe`; necesita plantilla de exportación de Windows de la misma versión de Godot. Se prueba en Windows fuera del editor. |
| Linux Desktop | Comparación | Genera un ejecutable x86_64 para Linux; requiere su plantilla de exportación y debe probarse en Linux. No sustituye a la build Windows. |

## Build de escritorio
El preset Windows exporta a `build/windows/ElBosqueDelDragon.exe` y su archivo de datos `.pck` asociado. El directorio `build/` está ignorado por Git para no versionar binarios. Ejecuta el `.exe` junto con el `.pck` con el editor cerrado; la exportación y el arranque headless ya se comprobaron.
