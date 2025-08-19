// ALU32 Test Script for HardwareSimulator
// Tests various ALU operations including arithmetic, logical, and overflow detection

load ALU32.hdl,
output-file ALU32.out,
compare-to ALU32.cmp,
output-list x%B1.32.1 y%B1.32.1 zx%B1.1.1 nx%B1.1.1 zy%B1.1.1 ny%B1.1.1 f%B1.1.1 no%B1.1.1 out%B1.32.1 zr%B1.1.1 ng%B1.1.1 overflow%B1.1.1;

// Test 1: 0 + 0 = 0
set x %B00000000000000000000000000000000,
set y %B00000000000000000000000000000000,
set zx 0, set nx 0, set zy 0, set ny 0, set f 1, set no 0,
eval, output;

// Test 2: 1 + 2 = 3
set x %B00000000000000000000000000000001,
set y %B00000000000000000000000000000010,
set zx 0, set nx 0, set zy 0, set ny 0, set f 1, set no 0,
eval, output;

// Test 3: 0x0000FFFF + 0x00000001 = 0x00010000
set x %B00000000000000001111111111111111,
set y %B00000000000000000000000000000001,
set zx 0, set nx 0, set zy 0, set ny 0, set f 1, set no 0,
eval, output;

// Test 4: 3 - 5 = -2 (using subtraction flags)
set x %B00000000000000000000000000000011,
set y %B00000000000000000000000000000101,
set zx 0, set nx 0, set zy 1, set ny 1, set f 1, set no 1,
eval, output;

// Test 5: 0x7FFFFFFF + 1 = overflow (largest positive + 1)
set x %B01111111111111111111111111111111,
set y %B00000000000000000000000000000001,
set zx 0, set nx 0, set zy 0, set ny 0, set f 1, set no 0,
eval, output;

// Test 6: 0xAAAAAAAA & 0x55555555 = 0x00000000 (logical AND)
set x %B10101010101010101010101010101010,
set y %B01010101010101010101010101010101,
set zx 0, set nx 0, set zy 0, set ny 0, set f 0, set no 0,
eval, output;

// Test 7: NOT operation (x = 0xFFFFFFFF, no = 1)
set x %B11111111111111111111111111111111,
set y %B00000000000000000000000000000000,
set zx 0, set nx 0, set zy 1, set ny 0, set f 0, set no 1,
eval, output;

// Test 8: Zero operation (zx = 1, zy = 1)
set x %B11111111111111111111111111111111,
set y %B11111111111111111111111111111111,
set zx 1, set nx 0, set zy 1, set ny 0, set f 0, set no 0,
eval, output;

// Test 9: Negative number test (large negative + small positive)
set x %B10000000000000000000000000000000,
set y %B00000000000000000000000000000001,
set zx 0, set nx 0, set zy 0, set ny 0, set f 1, set no 0,
eval, output;

// Test 10: OR operation simulation (using flags to create OR from AND)
set x %B10101010101010101010101010101010,
set y %B01010101010101010101010101010101,
set zx 0, set nx 1, set zy 0, set ny 1, set f 0, set no 1,
eval, output;
