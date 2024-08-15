-- 内部表のインデックスが使用されるNested Loops
SELECT /*+ LEADING(E D) USE_NL(D) */ 
  E.EMP_ID
  , E.EMP_NAME
  , E.DEPT_ID
  , D.DEPT_NAME
FROM 
  EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPT_ID = D.DEPT_ID
;

-- 内部表のインデックスが使用されないNested Loops
SELECT /*+ LEADING(E D) USE_NL(D) FULL(D) */ 
  E.EMP_ID
  , E.EMP_NAME
  , E.DEPT_ID
  , D.DEPT_NAME
FROM 
  EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPT_ID = D.DEPT_ID
;

