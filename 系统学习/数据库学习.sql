--用户权限
select * from perm_user where user_name='admin';

select pr.*,pur.UR_ID
    from PERM_ROLE pr,PERM_USER_ROLE pur where pr.ROLE_ID=pur.ROLE_ID and
    pur.USER_ID=0 and pr.VALID='Y';
    
select * from perm_role where role_name='ADMIN';

select * from PERM_ROLE_PERMISSION where role_id=369;


select * from PERM_PERMISSION where valid='Y' and name like '系统管理';
select * from PERM_PERMISSION where valid='Y' and parent_id=1907;

--产品
--product id:380263
select ss.supplier_name,sc.* from  SUPP_CONTRACT sc, SUPP_SUPPLIER ss where ss.supplier_id=sc.supplier_id and ss.supplier_name like '%lzy%' and sc.end_time>=sysdate;
select * from supp_contract where supplier_id=16231 and end_time>=sysdate;
select *
  from SUPP_SUPPLIER
 where SUPPLIER_NAME like '%lzy%';
 
select * from lvmama_ver.PROD_PRODUCT where product_id=380263;
select * from lvmama_super.PROD_PRODUCT;
 
--Batch Job
select * from lvmama_super.COM_TASK where task_id=869; 
select to_char(t.parameter),t.*  from lvmama_super.COM_TASK t where t.task_name like '%异构%';
 
--异构数据模板管理

SELECT * FROM lvmama_pet.SYNC_TEMPLATE where template_id = 480;
SELECT * FROM lvmama_pet.SYNC_TEMPLATE t where t.user_name='LVMAMA_VER' and t.table_name='PROD_DEST_RE' and t.data_source_id='vstDataSource';
SELECT * FROM lvmama_pet.SYNC_TEMPLATE t where t.table_name='PROD_PRODUCT' ;
SELECT distinct t.table_name FROM lvmama_pet.SYNC_TEMPLATE t;
SELECT distinct t.user_name,t.data_source_id FROM lvmama_pet.SYNC_TEMPLATE t;
SELECT distinct t.data_source_id FROM lvmama_pet.SYNC_TEMPLATE t;

select *
  from lvmama_pet.sync_template_sql
 where template_id = 402
 order by sort;

select t.user_name, t.table_name, t.data_source_id,t.description, ts.data_source_id,ts.sql_type,ts.*
  from lvmama_pet.SYNC_TEMPLATE t, lvmama_pet.sync_template_sql ts
 where t.template_id = ts.template_id
   and t.table_name = 'PROD_PRODUCT'
   and t.template_id=420
   order by t.template_id,ts.trigger_type,ts.sql_type,ts.sort asc;

select * from lvmama_pet.SYNC_TRIGGER;
--LVMAMA_VER
--PROD_DEST_RE
--vstDataSource
