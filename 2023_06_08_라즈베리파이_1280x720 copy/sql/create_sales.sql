CREATE TABLE sales (
  idx int NOT NULL AUTO_INCREMENT,
  dateitem varchar(26) NOT NULL,
  prdName varchar(15) NOT NULL,
  prdPrice int NOT NULL,
  count int NOT NULL,
  sellPrice int NOT NULL,
  PRIMARY KEY (idx)
);
