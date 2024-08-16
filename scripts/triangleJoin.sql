SELECT /*+ LEADING(A B C) USE_NL(B C) */
  A.COL_A, B.COL_B, C.COL_C
FROM
  TABLE_A A INNER JOIN TABLE_B B
    ON A.COL_A = B.COL_B
  INNER JOIN TABLE_C C
    ON A.COL_A = C.COL_C
;