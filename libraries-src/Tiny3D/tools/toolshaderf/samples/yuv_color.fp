!!FP1.0
TEX   R0, f[TEX0], TEX0, 2D;
ADDR  R0.x, R0, {-0.0625};
MULR  R1.x, R0, {1.164};
ADDR  R0.xy, R0.zyzw, {-0.5}.x;
MADR  R1.y, -R0.x, {0.81300002}.x, R1.x;
MADR_SAT R0.z, R0.y, {2.0179999}.x, R1.x;
MADR_SAT R0.x, R0, {1.596}, R1;
MADR_SAT R0.y, -R0, {0.391}.x, R1;
ADDR  R1.xyz, f[COL0], -R0;
MADR_SAT o[COLH].xyz, f[COL0].w, R1, R0;
MOVX  o[COLH].w, R0;
END
