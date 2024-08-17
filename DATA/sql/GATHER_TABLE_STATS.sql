BEGIN
  DBMS_STATS.GATHER_TABLE_STATS (
    OWNNAME      => '&1'
    , TABNAME    => '&2'
    , METHOD_OPT => 'FOR ALL INDEXED'
    , CASCADE    => TRUE
  )
  ;
END
;
/