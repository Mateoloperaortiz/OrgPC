// Raíz cuadrada entera por resta sucesiva de impares
// Entrada:  RAM[18] = N (N ≥ 0)
// Salida:   RAM[19] = piso(√N)
// Temporales:  RAM[20] = valor restante (copia mutable de N)
//              RAM[21] = impar actual (1,3,5,...)
//              RAM[22] = contador/resultado

// Copiar N de R18 al registro de trabajo R20
@18
D = M
@20
M = D            // R20 = N

// Inicializar: impar = 1 (R21), resultado = 0 (R22)
@1
D = A
@21
M = D            // R21 = 1
@22
M = 0            // R22 = 0

(SQRT_LOOP)
// Calcular D = R20 - R21 y verificar si es negativo
@20
D = M            // D = R20
@21
D = D - M        // D = R20 - R21
@SQRT_END
D; JLT           // si (R20 - R21) < 0 → fin

// R20 = R20 - R21 (guardar D)
@20
M = D            // R20 -= R21

// R21 = R21 + 2 (siguiente impar)
@21
M = M + 1
M = M + 1

// R22 = R22 + 1 (incrementar resultado)
@22
M = M + 1

@SQRT_LOOP
0; JMP

(SQRT_END)
// Escribir resultado en R19
@22
D = M
@19
M = D

// Alto (bucle infinito)
(HALT)
@HALT
0; JMP
