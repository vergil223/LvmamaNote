--Ǯ�� ��ôͨ��UNITY_ORDER��ô����Ʒ������
select * from LVMAMA_SUPER.UNITY_ORDER t where t.pack_product_id;
select * from LVMAMA_SUPER.UNITY_ORDER_ITEM;

select * from LVMAMA_SUPER.UNITY_ORDER t where t.pack_product_id is not null order by create_time desc;--pack_product_id=349764 order_id=20022531
--97979
--350087
--97978
--345605
--343971
--344225

select * from LVMAMA_super.PROD_PRODUCT t where t.product_id=349764;

select * from LVMAMA_SUPER.UNITY_PRODUCT t where  t.product_id=97979;
select * from LVMAMA_SUPER.UNITY_PRODUCT_BRANCH t where t.product_id=97979;--�����Ʒ��UNITY_PRODUCT_BRANCH���PRODUCT_ID��SUPP_GOODS_ID������һ����

select * from LVMAMA_PET.TNT_PRODUCT t  where t.product_id=97979;
select * from LVMAMA_PET.TNT_SELL_PACKAGE t where t.product_id=185545;

