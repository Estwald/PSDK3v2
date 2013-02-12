!!FP1.0
TEX   R0, f[TEX0], TEX0, 2D;
ADDR  R0.x, R0, {-0.0625};
ADDR  R1.xy, R0.zyzw, {-0.5}.x;
MULR  R0.x, R0, {1.164};
MADR  R0.y, -R1.x, {0.81300002}.x, R0.x;
MADR_SAT  R2.z, R1.y, {2.0179999}.x, R0.x;
MADR_SAT  R2.y, -R1, {0.391}.x, R0;
MADR_SAT  R2.x, R1, {1.596}, R0;
MOVX  o[COLH].xyz, R2;
MOVX  o[COLH].w, R0;
END
