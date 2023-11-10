--------------------------------------------------------
--  File created - Tuesday-April-11-2023 By Gregory Gao   
--------------------------------------------------------
DROP TABLE IF EXISTS AMES_ORDER;
DROP TABLE IF EXISTS AMES_ORDER_PRODUCT;
DROP TABLE IF EXISTS AMES_PRODUCT;
DROP TABLE IF EXISTS AMES_USER;
DROP TABLE IF EXISTS AMES_USER_DETAIL;
DROP TABLE IF EXISTS AMES_USER_AMES_USER_PROFILE;
DROP TABLE IF EXISTS AMES_USER_PROFILE;

--------------------------------------------------------
--  DDL for Table AMES_ORDER
--------------------------------------------------------

  CREATE TABLE AMES_ORDER
   (ID int, 
  PURCHASE_DATE DATE, 
  USER_ID int
   );
--------------------------------------------------------
--  DDL for Table AMES_ORDER_PRODUCT
--------------------------------------------------------

  CREATE TABLE AMES_ORDER_PRODUCT 
   (ID int, 
  QTY int, 
  ORDER_ID int, 
  PRODUCT_ID int
   );
--------------------------------------------------------
--  DDL for Table AMES_PRODUCT
--------------------------------------------------------

  CREATE TABLE AMES_PRODUCT 
   (  ID int, 
  NAME VARCHAR(255), 
  BRAND VARCHAR(255), 
  PRICE int, 
  STOCK int, 
  IMAGE VARCHAR(255)
   );
--------------------------------------------------------
--  DDL for Table AMES_USER
--------------------------------------------------------

  CREATE TABLE AMES_USER
   (USERNAME VARCHAR(100), 
  PASSWORD VARCHAR(100), 
  ID int
   );
--------------------------------------------------------
--  DDL for Table AMES_USER_DETAIL
--------------------------------------------------------

  CREATE TABLE AMES_USER_DETAIL 
   (ID int, 
  NAME VARCHAR(100), 
  PHONE VARCHAR(20), 
  EMAIL VARCHAR(100), 
  ADDRESS1 VARCHAR(100), 
  ADDRESS2 VARCHAR(100), 
  CITY VARCHAR(100), 
  STATE VARCHAR(100), 
  ZIP VARCHAR(100), 
  USER_ID int
   );
--------------------------------------------------------
--  DDL for Table AMES_USER_AMES_USER_PROFILE
--------------------------------------------------------

  CREATE TABLE AMES_USER_AMES_USER_PROFILE 
   (ID int, 
  USER_ID int, 
  USER_PROFILE_ID int
   );
--------------------------------------------------------
--  DDL for Table AMES_USER_PROFILE
--------------------------------------------------------

  CREATE TABLE AMES_USER_PROFILE 
   (ID int, 
  TYPE VARCHAR(100)
   );
--------------------------------------------------------
--  DDL for Sequence AMES_ORDER_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_ORDER_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_ORDER_SEQ
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Sequence AMES_ORDER_PRODUCT_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_ORDER_PRODUCT_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_ORDER_PRODUCT_SEQ
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Sequence AMES_PRODUCT_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_PRODUCT_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_PRODUCT_SEQ
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Sequence AMES_USER_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_USER_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_USER_SEQ
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Sequence AMES_USER_DETAIL_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_USER_DETAIL_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_USER_DETAIL_SEQ
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Sequence AMES_USER_AMES_USER_PROFILE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_USER_AMES_USER_PROFILE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_USER_AMES_USER_PROFILE_SEQ
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Sequence AMES_USER_PROFILE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.AMES_USER_PROFILE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.AMES_USER_PROFILE_SEQ
    OWNER TO kouyixiao86;

--------------------------------------------------------
--  DDL for Index AMES_ORDER_PK
--------------------------------------------------------
ALTER TABLE AMES_ORDER ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index AMES_ORDER_PRODUCT_PK
--------------------------------------------------------
ALTER TABLE AMES_ORDER_PRODUCT ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index AMES_PRODUCT_PK
--------------------------------------------------------
ALTER TABLE AMES_PRODUCT ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index AMES_USER_PK
--------------------------------------------------------
ALTER TABLE AMES_USER ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index AMES_USER_DETAIL_PK
--------------------------------------------------------
ALTER TABLE AMES_USER_DETAIL ADD PRIMARY KEY (ID);

--------------------------------------------------------
--  DDL for Index AMES_USER_AMES_USER_PROFILE_PK
--------------------------------------------------------
ALTER TABLE AMES_USER_AMES_USER_PROFILE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index AMES_USER_PROFILE_PK
--------------------------------------------------------
ALTER TABLE AMES_USER_PROFILE ADD PRIMARY KEY (ID);

--------------------------------------------------------
--  DDL for Trigger Function AMES_ORDER_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.ORDER_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('AMES_ORDER_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.ORDER_ID()
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Trigger Function AMES_ORDER_PRODUCT_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.ORDER_PRODUCT_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('AMES_ORDER_PRODUCT_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.ORDER_PRODUCT_ID()
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Trigger Function AMES_PRODUCT_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.PRODUCT_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('AMES_PRODUCT_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.PRODUCT_ID()
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('AMES_USER_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_ID()
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_DETAIL_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_DETAIL_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('AMES_USER_DETAIL_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_DETAIL_ID()
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_AMES_USER_PROFILE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_USER_PROFILE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('AMES_USER_AMES_USER_PROFILE_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_USER_PROFILE_ID()
    OWNER TO kouyixiao86;
--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_PROFILE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_PROFILE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('AMES_USER_PROFILE_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_PROFILE_ID()
    OWNER TO kouyixiao86;
-----------------------------------------

--------------------------------------------------------
--  DDL for Trigger Function AMES_ORDER_TRG
--------------------------------------------------------
CREATE TRIGGER ames_order_id_gen_trg
    BEFORE INSERT
    ON public.AMES_ORDER
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.order_id();

--------------------------------------------------------
--  DDL for Trigger Function AMES_ORDER_PRODUCT_TRG
--------------------------------------------------------
CREATE TRIGGER ames_order_product_id_gen_trg
    BEFORE INSERT
    ON public.AMES_ORDER_PRODUCT
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.order_product_id();

--------------------------------------------------------
--  DDL for Trigger Function AMES_PRODUCT_TRG
--------------------------------------------------------
CREATE TRIGGER ames_product_id_gen_trg
    BEFORE INSERT
    ON public.AMES_PRODUCT
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.product_id();

--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_TRG
--------------------------------------------------------
CREATE TRIGGER ames_user_id_gen_trg
    BEFORE INSERT
    ON public.AMES_USER
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_id();

--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_DETAIL_TRG
--------------------------------------------------------
CREATE TRIGGER ames_user_detail_id_gen_trg
    BEFORE INSERT
    ON public.AMES_USER_DETAIL
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_detail_id();

--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_PROFILE_TRG
--------------------------------------------------------
CREATE TRIGGER ames_user_profile_id_gen_trg
    BEFORE INSERT
    ON public.AMES_USER_PROFILE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_profile_id();

--------------------------------------------------------
--  DDL for Trigger Function AMES_USER_AMES_USER_PROFILE_TRG
--------------------------------------------------------
CREATE TRIGGER ames_user_ames_user_profile_id_gen_trg
    BEFORE INSERT
    ON public.AMES_USER_AMES_USER_PROFILE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_user_profile_id();
------------------------------------------------------------
------------------------------------------------------------
  
Insert into AMES_ORDER (ID,PURCHASE_DATE,USER_ID) values (1,'2022-02-22',2);

Insert into AMES_ORDER_PRODUCT (ID,QTY,ORDER_ID,PRODUCT_ID) values (1,2,1,1);

Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (1,'iPhone','Apple',100,100,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone.jpg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (4,'iPhone4','Apple',400,400,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone4.jpg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (3,'iPhone3GS','Apple',300,300,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone3GS.jpg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (2,'iPhone3G','Apple',200,200,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone3G.jpg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (5,'iPhone4S','Apple',500,500,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone4S.jpg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (6,'iPhone5','Apple',600,600,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone5.jpeg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (7,'iPhone5C','Apple',700,700,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone5c.png');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (8,'iPhone5S','Apple',800,800,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone5s.jpg');
Insert into AMES_PRODUCT (ID,NAME,BRAND,PRICE,STOCK,IMAGE) values (9,'iPhone6','Apple',900,900,'https://s3.us-east-2.amazonaws.com/msi-tech-2019/iphone6.jpg');

Insert into AMES_USER (USERNAME,PASSWORD,ID) values ('admin','$2a$11$aL.ou06hFDE1p23WLTf6..yeq879FxCWZEE8ATEzkU/lw/Utaut2m',1);
Insert into AMES_USER (USERNAME,PASSWORD,ID) values ('user','$2a$11$D031sn4yBKa8m3KmUc.fGuvjCwwyadyrVgfU3SH23McMenLj9chF.',2);

Insert into AMES_USER_AMES_USER_PROFILE (ID,USER_ID,USER_PROFILE_ID) values (2,2,2);
Insert into AMES_USER_AMES_USER_PROFILE (ID,USER_ID,USER_PROFILE_ID) values (1,1,1);

Insert into AMES_USER_PROFILE (ID,TYPE) values (1,'ROLE_ADMIN');
Insert into AMES_USER_PROFILE (ID,TYPE) values (2,'ROLE_USER');
