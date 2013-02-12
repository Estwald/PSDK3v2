!!FP1.0
TEX   R0, f[TEX0], TEX0, 2D;
TEX   R1, f[TEX1], TEX1, 2D;
ADDR  R1, R1, -R0;
MADR  R0, R1, {0.5}.x, R0;
MULX  o[COLH], R0, f[COL0];
END
