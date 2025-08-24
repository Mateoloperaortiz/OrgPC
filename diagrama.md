
# Explicación del Diagrama ALU32  

El diagrama de nuestra ALU de 32 bits fue construido a partir de dos ALU de 16 bits: una encargada del procesamiento de la parte baja y otra de la parte alta de los operandos. Los datos de entrada de 32 bits se dividen en mitades, lo que permite que ambas ALU operen en paralelo bajo la dirección de las señales de control (`zx, nx, zy, ny, f, no`), las cuales determinan el tipo de operación a ejecutar.  

Cada ALU genera un resultado parcial y banderas locales, que luego son combinados mediante multiplexores y compuertas lógicas para conformar la salida global de 32 bits. De manera adicional, un circuito de banderas integra la información de ambos bloques para calcular indicadores de estado a nivel de palabra completa, tales como `zr` (resultado nulo), `ng` (resultado negativo según el bit más significativo) y `ov` (desbordamiento aritmético).  

Este diseño refleja un enfoque modular que facilita la reutilización de componentes previamente diseñados y probados, lo cual simplifica el proceso de verificación y reduce la complejidad del desarrollo. Sin embargo, la necesidad de encadenar el acarreo entre la ALU inferior y la superior puede introducir una latencia adicional, constituyendo una desventaja respecto a una implementación monolítica de 32 bits. Pese a ello, el uso de bloques de menor tamaño ofrece ventajas en términos de flexibilidad, escalabilidad y claridad en la organización del sistema.  
