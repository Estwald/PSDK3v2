!!FP1.0
TEX   R1, f[TEX0], TEX1, 2D;
TEX   R0, f[TEX0], TEX0, 2D;
ADDR  R1.y, R0.x, {-0.0625}.x;
TEX   R0, f[TEX0], TEX2, 2D;
MULR  R0.y, R1, {1.164}.x;
ADDR  R0.x, R0, {-0.5};
ADDR  R1.x, R1, {-0.5};
MADR  R0.z, -R0.x, {0.81300002}.x, R0.y;
MADR_SAT R2.z, R1.x, {2.0179999}.x, R0.y;
MADR_SAT R2.y, -R1.x, {0.391}.x, R0.z;
MADR_SAT R2.x, R0, {1.596}, R0.y;
MOVX  o[COLH].xyz, R2;
MOVX  o[COLH].w, R0;
MOVX  o[COLH].w, {1}.x;
END
