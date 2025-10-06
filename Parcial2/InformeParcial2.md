# Informe Técnico – Parcial 2 (Hack Assembly)

- Código fuente: `sqrt_R18_R19.asm`, `inicial_L.asm`
- Scripts y apoyo: `sqrt_R18_R19.tst`, `sqrt.out`, `GuionVideo.md`

Nombres del equipo

- Mateo Lopera
- Juan Gonzalo
- Camilo Arbelaez
- Mariana Garcia

Ejercicio 1 — Raíz Cuadrada Entera (RAM[18] → RAM[19])

- Algoritmo: resta sucesiva de impares. La suma `1 + 3 + … + (2k−1) = k²`. Restamos impares a `N` hasta que el siguiente haría al restante negativo; el número de restas completas es `floor(sqrt(N))`.
- Razones de elección: simple y robusto, no requiere multiplicaciones; usa solo tres temporales (`R20..R22`); fácil de razonar y depurar en el CPUEmulator.
- Correctitud: tras `k` iteraciones `N − (1+3+…+(2k−1)) = N − k²`. La mayor `k` con `N − k² ≥ 0` satisface `k² ≤ N < (k+1)²` ⇒ resultado `k`.
- Complejidad: tiempo `O(⌊√N⌋)`; espacio `O(1)`.
- Registros y memoria:
  - `R18` entrada (no se modifica), `R19` salida.
  - `R20` restante mutable, `R21` impar actual, `R22` contador/resultado.
- Uso: cargar `sqrt_R18_R19.asm`, Reset, fijar `RAM[18]=N`, Run; el resultado queda en `RAM[19]`. El programa termina en un bucle `HALT`.
- Pruebas: `sqrt_R18_R19.tst` ejecuta casos (`0,1,2,3,4,15,16,24,25,32767`) y genera `sqrt.out` con `N` y `floor(sqrt(N))`.

Ejercicio 2 — Inicial interactiva “L” (dos tipografías + teclado)

- Diseño gráfico: la “L” se compone de rectángulos (palabras en la memoria `SCREEN`). Se dibuja una base (columna izquierda + barra inferior) y una sombra desplazada (+1 palabra, +2 filas) como segunda tipografía superpuesta. La letra es visible desde el inicio (regla del reto).
- Interacción: se lee `KBD`; solo la tecla `L` (ASCII 76) activa un subrayado (negro) dos filas por debajo. Cualquier otra entrada o ausencia de tecla limpia el subrayado (blanco).
- Estructura de código:
  - Parámetros de posición/tamaño: `L_XW`, `L_Y`, `L_WW`, `L_H`.
  - Bucle `MAIN_LOOP`: `@KBD` → compara con `LKEY` → `(UL)` subraya o `(CLR)` limpia.
  - `FILL_RECT`: calcula `rowAddr = SCREEN + XW + 32*Y` y recorre filas (`ROW_LOOP`) y palabras (`WORD_LOOP`) pintando `COLOR`.
- Uso: cargar `inicial_L.asm`, Run. En el campo Keyboard del emulador, presionar `L` para activar; soltar/otra tecla para limpiar.

Dificultades y soluciones

- Codificación/acentos: ciertos comentarios con acentos provocaban errores de parseo; se migró a comentarios ASCII y se normalizó la sintaxis (`D;JLT`, bucle `HALT`).
- Scripts `.tst`: el CPUEmulator marcó “illegal terminator: '_'” con algunos nombres; se añadió `sqrt.asm` como wrapper sin guion bajo y se ajustó `output-list` a `RAM[..]%D1.1.1`.
- Cálculo de filas en `SCREEN`: se implementó suma de `32` por fila (`Y_ADD_LOOP`) para avanzar correctamente por la memoria de video.

Distribución del trabajo y aprendizajes

- [Completar: responsable de sqrt, de inicial+teclado, de pruebas/video].
- Aprendizajes: traducción de lógica matemática a ensamblador Hack, manejo de memoria mapeada (`SCREEN`, `KBD`), diseño visual con primitivas sencillas y pruebas automatizadas en el emulador.

Anexo: verificación rápida

- Casos manuales: `N={0,1,2,3,4,15,16,24,25}` → `RAM[19]={0,1,1,1,2,3,4,4,5}`.
- Archivos: `sqrt_R18_R19.asm`, `sqrt.asm`, `sqrt_R18_R19.tst`, `sqrt.out`, `inicial_L.asm`, `GuionVideo.md`.
