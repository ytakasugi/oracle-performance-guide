-- CREATE SEQUENCE TEST_SEQ START WITH 0 INCREMENT BY 1 MINVALUE 0 MAXVALUE 100000000 CYCLE;
SET SERVEROUTPUT ON

DECLARE
  V_CURRENT   NUMBER(10, 0);

  PROCEDURE RESET_SEQUENCE(P_SEQ IN VARCHAR2) IS
  BEGIN
    -- 現在値を取得
    EXECUTE IMMEDIATE 'SELECT ' || P_SEQ ||'.NEXTVAL FROM DUAL' INTO V_CURRENT
    ;
    -- 現在値から1を引く
    V_CURRENT := V_CURRENT - 1
    ;
    -- シーケンスの削除
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || P_SEQ
    ;
    -- シーケンスの再作成
    EXECUTE IMMEDIATE 'CREATE SEQUENCE ' || P_SEQ || ' START WITH 0 INCREMENT BY 1 MINVALUE 0 MAXVALUE 100000000 CYCLE'
    ;
    -- 増分値を変更
    EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || P_SEQ || ' INCREMENT BY ' || V_CURRENT
    ;
    -- 現在のシーケンス値を進める
    EXECUTE IMMEDIATE 'SELECT ' || P_SEQ ||'.NEXTVAL FROM DUAL' INTO V_CURRENT
    ;
    -- シーケンスの増分値を戻す
    EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || P_SEQ || ' INCREMENT BY 1'
    ;
  END
  ;
BEGIN
  RESET_SEQUENCE('&1')
  ;
END
;
/