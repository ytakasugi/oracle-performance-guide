CREATE TABLE Orders
(
  order_id  CHAR(8) NOT NULL,
  shop_id   CHAR(4) NOT NULL,
  shop_name VARCHAR(256) NOT NULL,
  receive_date DATE NOT NULL,
  process_flg CHAR(1) NOT NULL,
  CONSTRAINT pk_Orders PRIMARY KEY(order_id)
);

--

set echo off
set verify off
set feedback off
set termout off
set timing on

var sid varchar2(4);
exec :sid := '0001';

spool case_10_5_2.log

SELECT COUNT(*)
FROM ORDERS
WHERE
SHOP_ID = :sid
;

set timing off
spool off
quit