BEGIN
  DBMS_STATS.GATHER_SCHEMA_STATS (
    OWNNAME      => '&1'
    , METHOD_OPT => 'FOR ALL INDEXED'
    , CASCADE    => TRUE
  )
  ;
END
;
/