## 1. Resolución Preguntas De Pensamiento Crítico  
A continuación, se contestarán las preguntas de pensamiento crítico que se han propuesto para este primer parcial.  

### 1.1 Modularidad: Comparación entre 2 ALU16 y 1 ALU32  

**Ventajas de utilizar 2 ALU16**  
- Reutilización de diseño: Permite aprovechar un módulo ya diseñado y verificado, reduciendo el esfuerzo de desarrollo.  
- Facilidad de prueba: Al ser módulos más pequeños, son más sencillos de verificar de manera individual.  
- Potencial paralelismo: Posibilita la ejecución de operaciones SIMD (Single Instruction, Multiple Data) en datos de 16 bits.  

**Desventajas de utilizar 2 ALU16**  
- Mayor latencia: La propagación del carry entre las dos unidades introduce un retardo adicional.  
- Complejidad de control: La gestión de dos unidades y la sincronización entre ellas incrementa la lógica de control requerida.  

**Ventajas de una ALU32 monolítica**  
- Menor latencia: Al estar integrada en un solo módulo, la ruta crítica se optimiza, reduciendo el tiempo de ejecución.  
- Control simplificado: La lógica de control es más directa al manejarse como una única unidad.  

**Desventajas de una ALU32 monolítica**  
- Diseño más complejo: Requiere diseñar y verificar un circuito de mayor tamaño.  
- Mayor área de silicio: Ocupa más espacio en el chip en comparación con diseños modulares.  
- Menor flexibilidad: No permite el aprovechamiento eficiente para operaciones de menor anchura (16 bits).  

#### 1.1.1 Ejemplo de Modularidad: 2 ALU16 vs 1 ALU32  
**Caso:** Suma de 32 bits  
`A = 0x1234ABCD`, `B = 0x5678EF01`.  

- **Con 2 ALU16**  
  - ALU16 inferior (bits [15:0]): `0xABCD + 0xEF01 = 0x19ACE` → resultado bajo `0x9ACE` con carry out = 1.  
  - ALU16 superior (bits [31:16]): `0x1234 + 0x5678 + carry(1) = 0x68AD`.  
  - Resultado final: `0x68AD9ACE`.  
  - Desventaja ilustrada: el carry debe propagarse entre módulos, añadiendo retardo.  

- **Con 1 ALU32**  
  - Suma en un solo paso: `0x1234ABCD + 0x5678EF01 = 0x68AD9ACE`.  
  - Ventaja ilustrada: menor latencia al no requerir propagación de carry entre módulos externos.  

---

### 1.2 Soporte para Operaciones con Signo (Signed) y sin Signo (Unsigned)  

Para soportar ambos tipos no es necesario cambiar la operación aritmética base (p. ej., la suma), sino la interpretación de resultados y el control de ciertas operaciones.  

**Banderas de estado:**  
- Carry (C): relevante para unsigned (C=1 → sin préstamo en resta; C=0 → con préstamo).  
- Overflow (V/OV): relevante para signed.  

**Desplazamientos:**  
- Lógico (LSR/LSL): para datos unsigned.  
- Aritmético (ASR): para datos signed (preserva el bit de signo).  

**Comparaciones:**  
- Unsigned: se basan en Carry y Zero (típicamente a partir de `A - B`).  
- Signed: consideran bit de signo y Overflow (p. ej., `N ⊕ V`, junto con `Z`).  

#### 1.2.1 Ejemplo de Soporte para Signed vs. Unsigned  
- **Resta de 8 bits:** `A = 100 (0x64)`, `B = 50 (0x32)`  
  - Unsigned: `100 − 50 = 50`. Carry C = 1 (sin préstamo).  
  - Signed: `100 − 50 = 50`. Overflow = 0.  

- **Caso crítico:** `A = 50 (0x32)`, `B = 100 (0x64)`  
  - Unsigned: `50 − 100` produce underflow en unsigned; Carry C = 0 (hubo préstamo).  
  - Signed: `50 − 100 = −50` válido en complemento a 2; Overflow = 0.  

- **Operación de desplazamiento (8 bits):** `A = 0b10010011`  
  - Logical shift right (unsigned): `0b01001001` (entra 0 en MSB).  
  - Arithmetic shift right (signed): `0b11001001` (se preserva el MSB como bit de signo).  

---

### 1.3 Propagación de Acarreo (Carry Lookahead)  

En ripple-carry el acarreo avanza bit a bit, aumentando la latencia para anchos grandes.  
El carry-lookahead (CLA) anticipa los acarreos en paralelo mediante lógica adicional.  

- Ventaja: reducción significativa de la latencia.  
- Desventaja: incremento de complejidad y número de compuertas.  

#### 1.3.1 Ejemplo de Propagación de Acarreo  
**Suma 4 bits:** `A = 1101`, `B = 1011`  
- Ripple-carry: el carry avanza bit a bit; mayor retardo.  
- Carry-lookahead: calcula acarreos en paralelo (`c1 = g0 + p0·c0`, `c2 = g1 + p1·g0 + p1·p0·c0`, …), reduciendo niveles lógicos y la latencia total.  

---

### 1.4 Optimización para Reducir el Número de Compuertas  

- Compartir recursos: mismo sumador para suma y resta (complementar `B` y ajustar `Cin`).  
- Multiplexación de señales: muxes para seleccionar operaciones y evitar duplicar hardware.  
- Implementación secuencial de operaciones complejas: p. ej., multiplicación iterativa si el rendimiento lo permite.  
- Reutilización de módulos: emplear comparadores/lógica existentes para varias funciones.  

#### 1.4.1 Ejemplo de Optimización con Menos Compuertas  
- Suma/resta con el mismo hardware: un sumador + mux para elegir `B` o `~B` y ajustar `Cin` según `SUB`.  
- Multiplicar por 4: usar desplazamiento a la izquierda 2 (`A << 2`) en lugar de un multiplicador dedicado.  

---

### 1.5 Escalabilidad a 64 o 128 bits  

- Enfoque modular: encadenar instancias de ALU más pequeñas (16/32 bits) propagando el carry entre bloques.  
- Diseño jerárquico: organizar por bloques que manejan segmentos de bits, facilitando verificación y coherencia.  
- Reutilización: al basarse en módulos validados, se reduce el esfuerzo y se mantiene consistencia funcional.  

Este enfoque permite escalar sin rediseñar por completo la ALU, optimizando tiempo y recursos.  

#### 1.5.1 Ejemplo de Escalabilidad a 64 o 128 bits  
- ALU de 64 bits con ALU16 encadenadas:  
  - ALU0: bits [15:0] → carry a ALU1  
  - ALU1: bits [31:16] → carry a ALU2  
  - ALU2: bits [47:32] → carry a ALU3  
  - ALU3: bits [63:48]  
- Ventaja: reutiliza el mismo módulo ALU16 cuatro veces con la misma lógica de conexión.  
- Extensión a 128 bits: añadir cuatro ALU16 más (total ocho), manteniendo el esquema.  

