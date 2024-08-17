CREATE TABLE Orders
(
  order_id  CHAR(8) NOT NULL,
  shop_id   CHAR(4) NOT NULL,
  shop_name VARCHAR(256) NOT NULL,
  receive_date DATE NOT NULL,
  process_flg CHAR(1) NOT NULL,
  CONSTRAINT pk_Orders PRIMARY KEY(order_id)
);