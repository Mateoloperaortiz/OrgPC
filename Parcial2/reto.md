# PROPÓSITO DEL TRABAJO

Este examen está diseñado para que pongas en práctica, de manera creativa y colaborativa, los fundamentos de la arquitectura de computadores a bajo nivel, usando el lenguaje ensamblador de la plataforma Nand2Tetris (Hack Assembly).

Trabajarás en equipo, porque en la ingeniería —como en la vida— los grandes logros nacen de la colaboración. Pero también entregarás evidencia individual, porque tu aporte personal es insustituible.

# LOS DOS RETOS: UNA COMBINACIÓN DE LÓGICA Y CREATIVIDAD

**Ejercicio 1: La raíz cuadrada considerando registros de memoria**

*Dado un número en el registro 18, calcula la parte entera de su raíz cuadrada y guarda el resultado en el registro 19.*

Este ejercicio te reta a implementar un algoritmo matemático clásico usando solo operaciones básicas (suma, resta, comparación, saltos) en ensamblador. No hay multiplicaciones, no hay librerías —solo tú, la máquina y tu ingenio.

¿Qué método usarías? ¿Búsqueda binaria? ¿Resta sucesiva de impares? ¿Aproximación iterativa? La elección es tuya, pero deberás justificar en tu informe. Aquí se evalúa tu capacidad para traducir lógica matemática en instrucciones de máquina.

Este punto es el corazón técnico del examen: demuestra que entiendes cómo una computadora “piensa” cuando resuelve un problema aparentemente simple… pero no trivial en ensamblador.

**Ejercicio 2: Iniciales en la pantalla — arte, interacción y restricción**

*Tomen las iniciales únicas de los miembros del equipo. Muestren en pantalla dos tipografías de cada inicial, una sobre la otra en posición de pantalla. Solo al presionar la tecla correspondiente, la inicial debe ‘activarse’. Las demás teclas… no existen*.

Este ejercicio es donde la creatividad se encuentra con la arquitectura. Deberán:

* Mapear coordenadas en la pantalla de memoria (Screen) para dibujar letras pixel a pixel.  
* Detectar entradas del teclado (Keyboard) y filtrar solo las iniciales del equipo.  
* Diseñar visualmente dos “tipografías” por letra (pueden ser tamaño, grosor, sombra, posición, animación… ¡lo que imaginen\!).  
* Hacer que el sistema responda solo a lo relevante, ignorando ruido —una metáfora perfecta de cómo los sistemas computacionales deben manejar entradas en el mundo real.

Aquí no solo se programa: se diseña, se experimenta, se juega. Es la oportunidad de demostrar que la computación no es fría… ¡Puede ser expresiva\!\*

# MODALIDAD: TRABAJO EN EQUIPO \+ RESPONSABILIDAD INDIVIDUAL

* Equipos de máximo 3 personas.  
* Entrega grupal: un solo video, un solo código fuente, un solo informe.  
* Evidencia individual obligatoria: cada estudiante debe subir, más lo de grupo:  
  * Captura del emulador con su inicial funcionando.  
  * Video corto (≤1 min) interactuando con el programa (presionando su tecla).  
  * Reflexión escrita (5 líneas): ¿qué aportaste? ¿qué aprendiste?

ENTREGABLES

1\. Video explicativo (máximo 5 minutos)
   \- Expliquen el algoritmo de raíz cuadrada.
   \- Muestren en vivo cómo reacciona el programa al presionar las iniciales.
   \- Mencionen decisiones clave de diseño y división del trabajo.

2\. Código fuente (.asm)

3\. Informe técnico (máximo 2 páginas)
   \- Nombres del equipo.
   \- Descripción del algoritmo elegido y por qué.
   \- Diseño gráfico de las iniciales: ¿cómo las dibujaron? ¿qué efectos usaron?
   \- Dificultades técnicas y cómo las superaron.
   \- Distribución del trabajo y aprendizajes clave.

RÚBRICA DE EVALUACIÓN (100 puntos)

Ejercicio 1: Raíz Cuadrada Entera (50 puntos)

| Criterio  | Puntos |  Detalle |
| :---- | :---- | :---- |
| Funcionalidad correcta | 40 | Funciona para 0, 1, 4, 15, y otros valores límite. Resultado en R19. |
| Manejo de memoria y registros | 40 | Sin sobreescritura de zonas críticas. Uso limpio de RAM. |
| Claridad del código | 20 | Comentarios útiles, etiquetas descriptivas, estructura legible. |

Ejercicio 2: Iniciales Interactivas (50 puntos)

| Criterio | Puntos | Detalle |
| :---- | :---- | :---- |
| Visualización de iniciales | 30 | Letras únicas del equipo visibles desde el inicio, con dos estilos superpuestos. |
| Interacción por teclado | 30 | Solo las iniciales responden. Feedback visual claro al presionar (parpadeo, cambio, etc.). |
| Creatividad y diseño | 40 | Estética, originalidad, uso de efectos visuales o animaciones simples. |

REGLAS CLARAS

\- Hack Assembly puro: Solo instrucciones compatibles con el emulador oficial.  
\- Programa autónomo: Debe correr sin intervención más allá de cargarlo y presionar teclas.  
\- Iniciales visibles desde el inicio: No aparecen solo al presionar —¡ya están ahí, esperando ser activadas\!
