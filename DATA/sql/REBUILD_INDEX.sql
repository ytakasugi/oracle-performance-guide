/* インデックスの再構築 */
SET SERVEROUTPUT ON

DECLARE
  CURSOR CUR IS
    SELECT
      'ALTER INDEX ' || INDEX_NAME || ' REBUILD' V_STMT
    FROM
      USER_INDEXES
    WHERE
      INDEX_NAME LIKE 'SRC%'
      AND STATUS != 'VALID'
    ;
BEGIN
  FOR REC IN CUR LOOP
    DBMS_OUTPUT.PUT_LINE(REC.V_STMT);
    EXECUTE IMMEDIATE REC.V_STMT;
  END LOOP;
END
;
/

quit
