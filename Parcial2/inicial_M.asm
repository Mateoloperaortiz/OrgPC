// Inicial 'M' interactiva con dos tipografías (base + sombra)
// - Visible desde el inicio
// - Solo la tecla 'M' activa subrayado; otras teclas se ignoran
// Pantalla: SCREEN=16384, Teclado: KBD=24576

(CONST)
@16384
D=A
@SCREEN
M=D
@24576
D=A
@KBD
M=D

// Tecla de interés (ASCII 'M' = 77)
@77
D=A
@LKEY
M=D

// Posición y tamaño (en palabras y filas)
@8
D=A
@L_XW
M=D           // x (en palabras)
@30
D=A
@L_Y
M=D           // y (en filas)
@5
D=A
@L_WW
M=D           // ancho (palabras)
@40
D=A
@L_H
M=D           // alto (filas)

// Variables de trabajo
@0
D=A
@XW
M=D
@Y
M=D
@WW
M=D
@H
M=D
@COLOR
M=D
@ROWADDR
M=D
@PTR
M=D
@I
M=D
@HC
M=D
@RET_ADDR
M=D

// DIBUJO TIPOGRAFÍA 1 (base): M = columna izq + columna der + diagonales superiores escalonadas
// Columna izquierda
@L_XW
D=M
@XW
M=D
@L_Y
D=M
@Y
M=D
@1
D=A
@WW
M=D
@L_H
D=M
@H
M=D
@COLOR
M=-1
@RET_M1
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M1)

// Columna derecha (x = XW + WW - 1)
@L_XW
D=M
@XW
M=D
@L_WW
D=M
@XW
M=M+D
@XW
M=M-1         // XW = XW + WW - 1
@L_Y
D=M
@Y
M=D
@1
D=A
@WW
M=D
@L_H
D=M
@H
M=D
@COLOR
M=-1
@RET_M2
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M2)

// Diagonal izquierda (escalones)
// Segmento 1: x = L_XW + 1, y = L_Y + 0, h = 12
@L_XW
D=M
@1
D=D+1
@XW
M=D
@L_Y
D=M
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_M3
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M3)

// Segmento 2: x = L_XW + 2, y = L_Y + 12, h = 12
@L_XW
D=M
@2
D=D+1
D=D+1         // +2
@XW
M=D
@L_Y
D=M
@12
D=D+A         // y + 12
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_M4
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M4)

// Segmento 3: x = L_XW + 2, y = L_Y + 24, h = 8 (refuerzo central)
@L_XW
D=M
@2
D=D+1
D=D+1
@XW
M=D
@L_Y
D=M
@24
D=D+A
@Y
M=D
@1
D=A
@WW
M=D
@8
D=A
@H
M=D
@COLOR
M=-1
@RET_M5
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M5)

// Diagonal derecha (escalones)
// Segmento 1: x = L_XW + WW - 2, y = L_Y + 0, h = 12
@L_XW
D=M
@XW
M=D
@L_WW
D=M
@XW
M=M+D
@XW
M=M-1
@XW
M=M-1         // XW = L_XW + WW - 2
@L_Y
D=M
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_M6
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M6)

// Segmento 2: x = L_XW + WW - 3, y = L_Y + 12, h = 12
@L_XW
D=M
@XW
M=D
@L_WW
D=M
@XW
M=M+D
@XW
M=M-1
@XW
M=M-1
@XW
M=M-1         // -3
@L_Y
D=M
@12
D=D+A         // y + 12
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_M7
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_M7)

// Segmento 3: x = L_XW + 2, y = L_Y + 24, h = 8 (centro). Ya dibujado arriba, pero refuerza simetría
// (Se omite duplicado para evitar exceso de tinta)

// DIBUJO TIPOGRAFÍA 2 (sombra): todo desplazado +1 palabra, +2 filas
// Columna izquierda sombra
@L_XW
D=M
@1
D=D+1        // +1 palabra
@XW
M=D
@L_Y
D=M
@2
D=D+A        // +2 filas
@Y
M=D
@1
D=A
@WW
M=D
@L_H
D=M
@H
M=D
@COLOR
M=-1
@RET_MS1
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_MS1)

// Columna derecha sombra
@L_XW
D=M
@1
D=D+1
@XW
M=D
@L_WW
D=M
@XW
M=M+D
@XW
M=M-1
@L_Y
D=M
@2
D=D+A
@Y
M=D
@1
D=A
@WW
M=D
@L_H
D=M
@H
M=D
@COLOR
M=-1
@RET_MS2
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_MS2)

// Diagonal izquierda sombra (x = L_XW + 2, y = L_Y + 2)
@L_XW
D=M
@2
D=D+1
D=D+1        // +2 palabras (1 base + 1 sombra desde +1 = total +2)
@XW
M=D
@L_Y
D=M
@2
D=D+A        // +2 filas
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_MS3
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_MS3)

// Diagonal izquierda sombra segmento 2 (x = L_XW + 3, y = L_Y + 14)
@L_XW
D=M
@3
D=D+1
D=D+1
D=D+1
@XW
M=D
@L_Y
D=M
@14
D=D+A
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_MS4
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_MS4)

// Diagonal derecha sombra segmento 1 (x = L_XW + WW - 1, y = L_Y + 2)
@L_XW
D=M
@1
D=D+1
@XW
M=D
@L_WW
D=M
@XW
M=M+D
@XW
M=M-1        // +WW - 1
@L_Y
D=M
@2
D=D+A        // +2 filas
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_MS5
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_MS5)

// Diagonal derecha sombra segmento 2 (x = L_XW + WW - 2, y = L_Y + 14)
@L_XW
D=M
@1
D=D+1
@XW
M=D
@L_WW
D=M
@XW
M=M+D
@XW
M=M-1
@XW
M=M-1        // -2
@L_Y
D=M
@14
D=D+A
@Y
M=D
@1
D=A
@WW
M=D
@12
D=A
@H
M=D
@COLOR
M=-1
@RET_MS6
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_MS6)

// BUCLE PRINCIPAL: leer teclado y activar/desactivar subrayado
(MAIN_LOOP)
@KBD
D=M           // D = tecla
@NO_KEY
D;JEQ

// ¿Es 'M'?
@LKEY
D=D-M
@ACT
D;JEQ

// Otra tecla -> limpiar
@CLR
0;JMP

(NO_KEY)
@CLR
0;JMP

(ACT)
@RET_ACT
D=A
@RET_ADDR
M=D
@UL
0;JMP
(RET_ACT)
@MAIN_LOOP
0;JMP

// Subrayado: 2 filas debajo de la letra, negro
(UL)
@L_XW
D=M
@XW
M=D
@L_Y
D=M
@L_H
D=D+M
@2
D=D+A        // y + h + 2
@Y
M=D
@L_WW
D=M
@WW
M=D
@2
D=A
@H
M=D
@COLOR
M=-1
@RET_UL
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_UL)
@RET_ADDR
A=M
0;JMP

// Limpiar subrayado (blanco)
(CLR)
@L_XW
D=M
@XW
M=D
@L_Y
D=M
@L_H
D=D+M
@2
D=D+A
@Y
M=D
@L_WW
D=M
@WW
M=D
@2
D=A
@H
M=D
@COLOR
M=0
@RET_CLR
D=A
@RET_ADDR
M=D
@FILL_RECT
0;JMP
(RET_CLR)
@RET_ADDR
A=M
0;JMP

// Relleno de rectángulo: (XW,Y) ancho=WW (palabras), alto=H (filas), color=COLOR
(FILL_RECT)
// rowAddr = SCREEN + XW
@SCREEN
D=M
@ROWADDR
M=D
@XW
D=M
@ROWADDR
M=M+D

// Añadir Y*32 a rowAddr
@Y
D=M
@HC
M=D
(Y_ADD_LOOP)
@HC
D=M
@Y_ADD_DONE
D;JEQ
@32
D=A
@ROWADDR
M=M+D
@HC
M=M-1
@Y_ADD_LOOP
0;JMP
(Y_ADD_DONE)

// hCounter = H
@H
D=M
@HC
M=D

(ROW_LOOP)
@HC
D=M
@RECT_DONE
D;JEQ

// PTR = ROWADDR
@ROWADDR
D=M
@PTR
M=D

// i = WW
@WW
D=M
@I
M=D

(WORD_LOOP)
@I
D=M
@ROW_NEXT
D;JEQ
@COLOR
D=M
@PTR
A=M
M=D
@PTR
M=M+1
@I
M=M-1
@WORD_LOOP
0;JMP

(ROW_NEXT)
@32
D=A
@ROWADDR
M=M+D
@HC
M=M-1
@ROW_LOOP
0;JMP

(RECT_DONE)
@RET_ADDR
A=M
0;JMP

// Bucle de seguridad
(HALT)
@HALT
0;JMP

