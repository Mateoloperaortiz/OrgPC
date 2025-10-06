// Integer square root via successive odd subtraction
// Input:    RAM[18] = N (N >= 0)
// Output:   RAM[19] = floor(sqrt(N))
// Temps:    RAM[20] = remaining (mutable copy of N)
//           RAM[21] = current odd (1,3,5,...)
//           RAM[22] = result counter

// Copy N from R18 to working register R20
@18
D = M
@20
M = D            // R20 = N

// Init: odd = 1 (R21), result = 0 (R22)
@1
D = A
@21
M = D            // R21 = 1
@22
M = 0            // R22 = 0

(SQRT_LOOP)
// Compute D = R20 - R21 and check if negative
@20
D = M            // D = R20
@21
D = D - M        // D = R20 - R21
@SQRT_END
D;JLT            // if (R20 - R21) < 0 then end

// R20 = R20 - R21 (store D)
@20
M = D            // R20 -= R21

// R21 = R21 + 2 (next odd)
@21
M = M + 1
M = M + 1

// R22 = R22 + 1 (increment result)
@22
M = M + 1

@SQRT_LOOP
0; JMP

(SQRT_END)
// Write result to R19
@22
D = M
@19
M = D

// Halt (infinite loop)
(HALT)
@HALT
0; JMP

