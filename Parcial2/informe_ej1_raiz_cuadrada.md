# Informe breve — Ejercicio 1: Raíz Cuadrada Entera (Hack Assembly)

- Código fuente: `Parcial2/sqrt_R18_R19.asm`
- Entrada: `RAM[18] = N (N ≥ 0)`
- Salida: `RAM[19] = floor(sqrt(N))`

## Resumen del método
Se implementó la raíz cuadrada entera usando la técnica de «resta sucesiva de impares». La idea es que la suma de los primeros `k` números impares es `k^2`. Por tanto, si restamos en orden los impares `1, 3, 5, ...` a `N` hasta que el acumulado sea negativo, el número de restas completas realizadas es `floor(sqrt(N))`.

Pseudocódigo (nivel alto):
```
restante = N
impar = 1
resultado = 0
mientras (restante - impar) >= 0:
    restante = restante - impar
    impar = impar + 2
    resultado = resultado + 1
return resultado
```

## Justificación de la elección
- Simplicidad y robustez: no requiere multiplicaciones ni subrutinas adicionales.
- Uso mínimo de registros: solo tres temporales (`R20..R22`).
- Fácil de razonar y comentar en ensamblador Hack.
- Rendimiento suficiente para el rango típico de valores (16 bits); complejidad sublineal respecto a `N`.

## Correctitud (idea)
Sea `S(k) = 1 + 3 + 5 + ... + (2k-1) = k^2`. Al iterar restando impares desde `N`, tras `k` iteraciones completas tenemos `N - S(k)`. La mayor `k` tal que `N - S(k) ≥ 0` satisface `k^2 ≤ N < (k+1)^2`, luego `k = floor(sqrt(N))`. El algoritmo termina cuando el siguiente impar haría el acumulado negativo, devolviendo exactamente `k`.

## Complejidad
- Tiempo: `O(floor(sqrt(N)))` iteraciones (una por impar). Para `N = 32767`, ~181 iteraciones.
- Espacio: `O(1)` registros temporales fijos (`R20`, `R21`, `R22`).

## Manejo de memoria y registros
- `R18`: entrada (no se modifica).
- `R19`: salida.
- `R20`: copia mutable de `N` (restante).
- `R21`: impar actual (1, 3, 5, ...).
- `R22`: contador de iteraciones (resultado).
- No se usan regiones especiales (Screen, Keyboard) ni otras zonas de RAM.

## Casos de prueba sugeridos
- `N = 0 → 0`
- `N = 1 → 1`
- `N = 2, 3 → 1`
- `N = 4 → 2`
- `N = 15 → 3`
- `N = 16 → 4`
- `N = 24 → 4`
- `N = 25 → 5`

En el CPU Emulator, cargar `Parcial2/sqrt_R18_R19.asm`, fijar `RAM[18] = N`, ejecutar y verificar `RAM[19]`.

## Supuestos y límites
- `N ≥ 0`. Para valores negativos, el algoritmo termina inmediatamente con resultado `0`.
- 16 bits con complemento a dos (convención Hack); el método evita desbordes por operar con incrementos/decrementos pequeños.

