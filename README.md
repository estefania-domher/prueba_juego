# El Bosque del Dragón

Prototipo 2D para Godot 4.7. El dragón debe recuperar tres árboles del bosque antes de que termine el minuto.

## Controles y reglas

- Flechas: mover al dragón en las cuatro direcciones.
- E: recoger el árbol más cercano cuando está a 92 píxeles o menos.
- Hay 3 árboles y 60 segundos. Recoger los tres gana la ronda; agotar el tiempo la termina.
- La distancia al árbol más cercano aparece en pantalla para ayudar a entender y depurar la regla de proximidad.

## Abrir y ejecutar

1. Abre Godot 4.7 o posterior y elige **Importar**.
2. Selecciona este directorio, donde está `project.godot`.
3. Pulsa **Ejecutar proyecto** (F5) para iniciar el juego.

La escena principal es `scenes/main.tscn`. El dragón se instancia desde `scenes/dragon.tscn`; cada árbol se instancia desde `scenes/arbol.tscn`.

## Scripts y señales

- `scripts/dragon.gd`: movimiento del `CharacterBody2D`, giro interpolado hacia la dirección de vuelo y emisión de `interact_requested` al pulsar E.
- `scripts/main.gd`: coordina puntuación y tiempo, calcula la distancia al árbol más cercano y recibe `interact_requested` y `RoundTimer.timeout`.
- `scripts/arbol.gd`: anima el árbol suavemente y emite `collected` cuando Main lo recoge.

Main conecta `Player.interact_requested` a su controlador de interacción. Al estar dentro del alcance, Main llama `collect()`; el árbol emite `collected` y Main aumenta el marcador. Al agotar el tiempo o reunir tres árboles, Main para al jugador.

## Exportación de escritorio

En **Proyecto > Exportar**, hay presets de Windows Desktop y Linux/BSD para comparar destinos. Para la entrega de Windows, selecciona **Windows Desktop** y exporta a `build/windows/ElBosqueDelDragon.exe`. La exportación requiere las plantillas de exportación correspondientes a tu versión de Godot. El procedimiento de prueba y los resultados se registran en `docs/pruebas.md`.

## Documentación de la práctica

- `explicacion_t2_2.txt`: explicación de quién emite y recibe las señales de T2.2.
- `docs/pruebas.md`: pruebas de juego, depuración, comparación de presets y comprobación de build.
- `CREDITS.md`: créditos de recursos externos.
