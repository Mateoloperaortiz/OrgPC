# Enduro - Juego de Carreras Circular

Un juego de carreras creato por Mateo, Camilo, Mariana y Gonzalo en nand2tetris/Jack.

## Descripción

El jugador controla un auto que se mueve en línea recta a velocidad constante. Usa las flechas para girar y navegar alrededor de la pista circular tipo donut. El objetivo es completar una vuelta completa sin chocar con las paredes.

## Características

- **Pista circular**: Diseño tipo donut con círculos concéntricos
- **Movimiento constante**: El auto avanza automáticamente en línea recta
- **Control de dirección**: Usa las flechas izquierda/derecha para girar el auto
- **Detección de colisiones**: Pierdes si chocas con las paredes interior o exterior
- **Condición de victoria**: Ganas al completar una vuelta y cruzar la línea de meta

## Controles

- **Flecha Izquierda**: Gira el auto a la izquierda (sentido antihorario)
- **Flecha Derecha**: Gira el auto a la derecha (sentido horario)
- **Q**: Salir del juego

## Archivos

- `Main.jack`: Punto de entrada del programa
- `Game.jack`: Lógica principal del juego
- `Car.jack`: Clase del auto con física circular
- `Track.jack`: Dibuja la pista tipo donut
- `Trig.jack`: Funciones trigonométricas para movimiento circular

## Cómo compilar y ejecutar

1. Usa el Jack Compiler para compilar todos los archivos .jack:
   ```
   JackCompiler Enduro
   ```

2. Ejecuta en el VM Emulator de nand2tetris:
   - Carga el directorio `Enduro`
   - Ejecuta el programa

## Mecánicas del juego

1. El auto inicia en la línea de meta (línea vertical en la parte superior)
2. El auto se mueve automáticamente en línea recta a velocidad constante
3. Usa las flechas izquierda/derecha para girar y navegar por la pista
4. No toques las paredes interior (círculo negro pequeño) o exterior (círculo negro grande)
5. Completa una vuelta completa en sentido horario y cruza la línea de meta para ganar

¡Buena suerte!
