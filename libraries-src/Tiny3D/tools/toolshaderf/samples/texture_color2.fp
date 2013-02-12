!!FP1.0
TEX   R0, f[TEX0], TEX0, 2D;
TEX   R1, f[TEX1], TEX1, 2D;
MUL   R0, R0, R1;
MULX  o[COLH], R0, f[COL0];
END
