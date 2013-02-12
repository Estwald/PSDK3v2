!!FP1.0
TEX   R1, f[TEX0], TEX2, 2D;
TEX   R0, f[TEX0], TEX0, 2D;
ADDR  R1.y, R0.x, {-0.0625}.x;
TEX   R0, f[TEX0], TEX1, 2D;
MULR  R0.y, R1, {1.164}.x;
ADDR  R1.x, R1, {-0.5};
ADDR  R0.w, R0.x, {-0.5}.x;
MADR  R1.y, -R1.x, {0.81300002}.x, R0;
MADR_SAT R0.x, R1, {1.596}, R0.y;
MADR_SAT R0.z, R0.w, {2.0179999}.x, R0.y;
MADR_SAT R0.y, -R0.w, {0.391}.x, R1;
ADDR  R1.xyz, f[COL0], -R0;
MADR_SAT o[COLH].xyz, f[COL0].w, R1, R0;
MOVX  o[COLH].w, {1}.x;
END
