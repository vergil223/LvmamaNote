--字段是vst_search_prod_distributor.LVMAMA_CLIENT_PRICE

select * from LVMAMA_VER.PROD_PRODUCT where product_id=412460;

select * from LVMAMA_VER.PROD_PRODUCT t where t.product_id=412460;
/*
412460,11,韩国首尔舞台剧拌饭秀《BIBAP》演出票,Y,2,Y,null,null,null,180889,2015-04-07 00:00:00.0,lv6249,2015-05-19 22:15:59.0,null,null,null,AUDITTYPE_PASS,N,null,BACK,null,null
*/

select * from LVMAMA_VER.SUPP_GOODS t where t.product_id=412460;
/*
,1706835,10141,16373,412460,1416978,20:00,R座 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,1,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:19:21.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706873,10141,16373,412460,1416977,S座,20:00 门票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,2,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:23:00.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706877,10141,16373,412460,1416979,18:00,R座 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,3,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:24:20.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706879,10141,16373,412460,1416948,20:00,VIP座 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,4,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:26:03.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706881,10141,16373,412460,1416950,S座,18:00 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,N,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,5,null,null,2015-04-07 00:00:00.0,lv6249,2015-05-22 19:32:36.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706907,10141,16373,412460,1416949,VIP座,18:00 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,6,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:28:03.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
*/

select * from LVMAMA_VER.COM_PUSH t where t.object_id=412460 and t.PUSH_CONTENT='VST_SEARCH_PROD_DISTRIBUTOR' and t.data_type='SEARCHINCREMENT'; 

select * from LVMAMA_VER.VST_SEARCH_PROD_DISTRIBUTOR where product_id=412460;
/* 线上：
ID  164157
PRODUCT_ID  412460
DISTRIBUTOR_IDS  
DISTRIBUTOR_PRICE  
LVMAMA_CLIENT_PRICE  
GROUP_PRICE	
SPIKE_TYPE_PRICE	
GROUP_END_TIME	
COMMISSION	
VIRTUAL_SALE_QUANTITY
*/

select * from LVMAMA_SUPER.com_task where web_service_url like '%LowestPriceUpdateJobService%';
/* BATCH JOB参数
{"compareValue":4,"factor":5,"categories":[1]}
{"compareValue":1,"factor":5,"categories":[1]}
{"compareValue":3,"factor":5,"categories":[1]}
{"compareValue":2,"factor":5,"categories":[1]}
{"compareValue":0,"factor":5,"categories":[1]}*/

--后台batch无日志
--PROD_PRODUCT_BRANCH.findNeedUpdateList
<select id="findNeedUpdateList" resultMap="NeedUpdateResultMap">
   SELECT *
    FROM (SELECT A.*, ROWNUM RN
            FROM (SELECT PPB.PROD_BRANCH_ID, PPB.PRODUCT_ID
	                  FROM LVMAMA_SUPER.PROD_PRODUCT_BRANCH PPB
	                  JOIN LVMAMA_SUPER.PROD_PRODUCT PP
	                    ON PPB.PRODUCT_ID = PP.PRODUCT_ID
	                 WHERE 
                      
                   PP.PRODUCT_TYPE = 'DIST'
 	 	/*AND (PP.CATEGORY_ID NOT IN (1)
 	 	OR PP.CATEGORY_ID IS NULL) */
	 AND (PPB.NEAR_DIF_DATE IS NULL OR PPB.NEAR_DIF_DATE = TRUNC(SYSDATE))
     AND PP.PRODUCT_ID in (798656,798694,798710,798712,798718,798720)          
	                 ORDER BY PPB.PRODUCT_ID) A
	         WHERE ROWNUM <= 1000)
	 WHERE RN >= 0
 </select>
 
select MOD(412460, 5) from dual;--{"compareValue":0,"factor":5,"categories":[1]}*/



select * from LVMAMA_SUPER.PROD_PRODUCT PPB where PPB.PRODUCT_ID=412460;
/*
PRODUCT_ID	412460
BIZ_CODE	
PRODUCT_NAME	不含早(1351971)
DESCRIPTION	
ADDITIONAL	false
MINIMUM	
ONLINE_TIME	
OFFLINE_TIME	
CREATE_TIME	2015-1-9 12:29:09
SELL_PRICE	0
MARKET_PRICE	0
PRODUCT_TYPE	DIST
STABLE_PRICE	
SHORT_NAME	
ADULT_QUANTITY	0
CHILD_QUANTITY	0
SMS_CONTENT	
WRAP_PAGE	
VALID	Y
PAY_TO_LVMAMA	
PAY_TO_SUPPLIER	
MAXIMUM	
SUB_PRODUCT_TYPE	
PRICE_UNIT	
SMALL_IMAGE	
PHYSICAL	false
SEND_SMS	true
NEAR_DATE	
COSTCONTAIN	
IMPORTMENTCLEW	
FILIALE_NAME	
GROUP_MIN	0
TRAVELLER_INFO_OPTIONS	
ORG_ID	
ON_LINE	false
MANAGER_ID	
CREATE_USER	
COUPON_ABLE	true
PAY_DEPOSIT	0
LAST_CANCEL_HOUR	
RECOMMEND_INFO_FIRST	
RECOMMEND_INFO_SECOND	
RECOMMEND_INFO_THIRD	
CAN_PAY_BY_BONUS	Y
COUPON_ACTIVITY	true
MAX_CASH_REFUND	0
IS_REFUNDABLE	Y
IS_FOREGIN	N
REGION_NAME	
IS_MANUAL_BONUS	N
IS_ANNIVERARY_PRODUCT	Y
IS_APERIODIC	false
AHEAD_BOOKING_DAYS	
IS_PREPAYMENT	Y
SHOW_SALE_DAYS	180
AUDITING_STATUS	PRODUCTS_SUBMITTED
HAS_SENSITIVE_WORD	
APPLICABLE_TRAVEL_DAYS_LIMIT	
APPLICABLE_TRAVEL_DAYS_CAPS	
APPLICABLE_SUB_PRODUCT_TYPE	
BOUNS_SCALE	
BOUNS_REASON	
BOUNS_START	
BOUNS_END	
BOUNS_LIMIT	
FREE_BACKABLE	N
SALE_UNIT_ID	1351971
PACK_TYPE	UN_PACK
CATEGORY_ID	1
MAX_GUESTS	2
HOTEL_PACKAGE	
LVMAMA_PACKAGE_TYPE	
BU_NAME	
*/
select PPB .*,'<br/>' from LVMAMA_SUPER.PROD_PRODUCT PPB where PPB .sale_unit_id in (1706835,1706873,1706877,1706879,1706881,1706907);
/*仿真
,798656,null,20:00,R座 成人票(1706835),null,false,null,null,null,2015-04-07 17:15:42.0,0,0,DIST,null,null,0,0,null,null,Y,null,null,null,null,null,null,false,true,null,null,null,null,0,null,null,false,null,null,true,0,null,null,null,null,Y,true,0,Y,N,null,N,Y,false,null,Y,180,PRODUCTS_SUBMITTED,null,null,null,null,null,null,null,null,null,N,1706835,UN_PACK,11,2015-06-04 07:06:23.0,0,N,null,null,
,798694,null,S座,20:00 门票(1706873),null,false,null,null,null,2015-04-07 17:28:37.0,0,0,DIST,null,null,0,0,null,null,Y,null,null,null,null,null,null,false,true,null,null,null,null,0,null,null,false,null,null,true,0,null,null,null,null,Y,true,0,Y,N,null,N,Y,false,null,Y,180,PRODUCTS_SUBMITTED,null,null,null,null,null,null,null,null,null,N,1706873,UN_PACK,11,2015-06-04 07:06:22.0,0,N,null,null,
,798710,null,18:00,R座 成人票(1706877),null,false,null,null,null,2015-04-07 17:34:24.0,0,0,DIST,null,null,0,0,null,null,Y,null,null,null,null,null,null,false,true,null,null,null,null,0,null,null,false,null,null,true,0,null,null,null,null,Y,true,0,Y,N,null,N,Y,false,null,Y,180,PRODUCTS_SUBMITTED,null,null,null,null,null,null,null,null,null,N,1706877,UN_PACK,11,2015-06-04 07:06:22.0,0,N,null,null,
,798712,null,20:00,VIP座 成人票(1706879),null,false,null,null,null,2015-04-07 17:35:17.0,0,0,DIST,null,null,0,0,null,null,Y,null,null,null,null,null,null,false,true,null,null,null,null,0,null,null,false,null,null,true,0,null,null,null,null,Y,true,0,Y,N,null,N,Y,false,null,Y,180,PRODUCTS_SUBMITTED,null,null,null,null,null,null,null,null,null,N,1706879,UN_PACK,11,2015-06-04 07:06:22.0,0,N,null,null,
,798718,null,S座,18:00 成人票(1706881),null,false,null,null,null,2015-04-07 17:36:14.0,0,0,DIST,null,null,0,0,null,null,Y,null,null,null,null,null,null,false,true,null,null,null,null,0,null,null,false,null,null,true,0,null,null,null,null,Y,true,0,Y,N,null,N,Y,false,null,Y,180,PRODUCTS_SUBMITTED,null,null,null,null,null,null,null,null,null,N,1706881,UN_PACK,11,2015-05-19 19:30:08.0,0,N,null,null,
,798720,null,VIP座,18:00 成人票(1706907),null,false,null,null,null,2015-04-07 17:37:01.0,0,0,DIST,null,null,0,0,null,null,Y,null,null,null,null,null,null,false,true,null,null,null,null,0,null,null,false,null,null,true,0,null,null,null,null,Y,true,0,Y,N,null,N,Y,false,null,Y,180,PRODUCTS_SUBMITTED,null,null,null,null,null,null,null,null,null,N,1706907,UN_PACK,11,2015-06-04 07:06:23.0,0,N,null,null,
*/
select * from LVMAMA_VER.SUPP_GOODS t where t.product_id=412460;
select t.aperiodic_flag from LVMAMA_VER.SUPP_GOODS t where t.product_id=412460；
/*仿真
,1706835,10141,16373,412460,1416978,20:00,R座 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,1,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:19:21.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706873,10141,16373,412460,1416977,S座,20:00 门票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,2,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:23:00.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706877,10141,16373,412460,1416979,18:00,R座 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,3,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:24:20.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706879,10141,16373,412460,1416948,20:00,VIP座 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,4,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:26:03.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706881,10141,16373,412460,1416950,S座,18:00 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,N,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,5,null,null,2015-04-07 00:00:00.0,lv6249,2015-05-22 19:32:36.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
,1706907,10141,16373,412460,1416949,VIP座,18:00 成人票,2877,PREPAID,Y,Y,N,N,NOTICETYPE_DISPLAY,null,SMS,null,1,0,Y,Y,null,null,SH_FILIALE,null,null,1,999,null,2877,420,11,ADULT,N,6,null,null,2015-04-07 00:00:00.0,lv6249,2015-06-02 11:28:03.0,null,N,null,null,null,N,11,N,N,5,OUTBOUND_BU,116,
*/

select PPB.NEAR_DIF_DATE,PPB.*,'<br/>' from LVMAMA_SUPER.PROD_PRODUCT_BRANCH PPB where PPB.product_id in (798656,798694,798710,798712,798718,798720);

select * from LVMAMA_SUPER.PROD_PRODUCT_BRANCH PPB where PPB.PRODUCT_ID=412460;--LVMAMA_SUPER.PROD_PRODUCT_BRANCH PPB中的sell price为0
/*
PROD_BRANCH_ID	1668378
CREATE_TIME	2015-1-9 12:29:09
BRANCH_NAME	渠道DEFAULT
BRANCH_TYPE	DEFAULT
ADULT_QUANTITY	
CHILD_QUANTITY	
MINIMUM	0
MAXIMUM	
PRICE_UNIT	
DESCRIPTION	
PRODUCT_ID	412460
ADDITIONAL	
ON_LINE	true
DEFAULT_BRANCH	
BREAKFAST	
BROADBAND	
BED_TYPE	
ICON	
SELL_PRICE	8000
MARKET_PRICE	
VISIBLE	
EXTRA_BED_ABLE	
TEMP_PRODUCT_ID	
VALID	Y
BRANCH_SERIAL_NUMBER	1668378
BERTH	
TODAY_ORDER_ABLE	false
VALID_BEGIN_TIME	
VALID_END_TIME	
STATION_STATION_ID	
INVALID_DATE	
INVALID_DATE_MEMO	
WEIXIN_LIJIAN	N
ONLY_CLIENT	N
NEAR_DIF_DATE	2115-6-5
COMMISSION_MODE	
DISCOUNT_RATE	
DATA_TYPE
*/


--------

--dist_product_list.jsp
--dist_prod_branch.jsp
--点同步时间价格表：Ajax触发：/super_back/prod/syncTimePrice：
--MessageFactory.newVstGoodsTimePriceUpdate(suppGoodsId, "SUPP_GOODS_FILL", buffer.toString())
--new Message(productId, objectType, ConstantJMS.EVENT_TYPE.VST_GOODS_TIME_PRICE.name());
--消息消费者：VSTTimePriceProcesser
--***********步骤一
--vstTimePriceService.autoPackage()
--a)创建或更新PROD_PRODUCT，PROD_PRODUCT_BRANCH,PROD_PRODUCT_BRANCH_ITEM
--b)发消息MessageFactory.newVSTProductMetaPriceMessage(productId, "PROD_PRODUCT_ID"));
--        new Message(metaBranchId, "VST_META_PRODUCT_BRANCH", ConstantJMS.EVENT_TYPE.VST_CHANGE_META_PRICE.name());
--消费者DistTimePriceProcesser
/*
syncBaseService.saveSyncTrigger(ppbList.get(i).getProdBranchId().toString(),
							"VIRTUAL", "PROD_PRODUCT_BRANCH", "superDataSource", "UPDATE",
							startStr, endStr, prodProductId.toString());
              
syncBaseService.saveSyncTrigger(prodProductId.toString(),
						"VIRTUAL", "VST_CHANGE_SELL_PRICE", "superDataSource", "UPDATE",
						pp.getSaleUnitId().toString(), pp.getPackType(), prodProductId.toString());
            
            syncBaseService.saveSyncTrigger(prodProductId.toString(),
						"VIRTUAL", "RETURN_COMMISSION_CHANGE", "superDataSource", "UPDATE", buffer.toString(), "", prodProductId.toString());              
*/              
--c)发消息MessageFactory.newDistProductCreateMessage(saleUnitId, packType)
--        new Message(saleUnitId, packType, ConstantJMS.EVENT_TYPE.DIST_PRODUCT_CREATE.name()); 
--消费者ProductRuProcesser



--***********步骤二
--com.lvmama.prd.catcher.AperiodicSingleTicketTimePriceCatcher
--仿真有数据
select t.*,'<br/><br/>' from LVMAMA_VER.SUPP_GOODS_ADD_TIME_PRICE t where t.supp_goods_id in (1706835,1706873,1706877,1706879,1706881,1706907);

--META_BRANCH_ID=1890098
--META_PRODUCT_ID=725569
select * from LVMAMA_SUPER.META_PRODUCT_BRANCH;

--仿真为空：
select * from LVMAMA_SUPER.DIST_META_TIME_PRICE t where t.meta_product_id=725569 and t.meta_branch_id=1890098;

select * from LVMAMA_SUPER.DIST_PROD_TIME_PRICE t;
select t.spec_date,t.product_id,t.audit_price,'<br/><br/>' from DIST_PROD_TIME_PRICE t where t.product_id=412460; 

--再生成一个message:MessageFactory.newVSTProductMetaPriceMessage(metaBranchId, "META_PRODUCT_BRANCH_ID@" + start + "@" + end)
--new Message(metaBranchId, "VST_META_PRODUCT_BRANCH", ConstantJMS.EVENT_TYPE.VST_CHANGE_META_PRICE.name());
--消费者：DistTimePriceProcesser 生成SyncTrigger：
/*syncBaseService.saveSyncTrigger(ppbList.get(i).getProdBranchId().toString(),
						"VIRTUAL", "PROD_PRODUCT_BRANCH", "superDataSource", "UPDATE",
						startStr, endStr, prodProductId.toString());*/
--用GROOVY触发更新
/*vstTimePriceService.updateTimePriceByProductBranchId(Long.valueOf(st.getFieldThree()),
				Long.valueOf(st.getPkValue()),
				DateUtil.converDateFromStr(st.getFieldOne()),
				DateUtil.converDateFromStr(st.getFieldTwo()));*/

/*syncBaseService.saveSyncTrigger(prodProductId.toString(),
					"VIRTUAL", "VST_CHANGE_SELL_PRICE", "superDataSource", "UPDATE",
					pp.getSaleUnitId().toString(), pp.getPackType(), prodProductId.toString());
          
GROOVY执行：          
productMessageProducer.sendMsg(MessageFactory.newVSTProductSellPriceMessage(Long.valueOf(st.getFieldOne()), st.getFieldTwo()));
new Message(prodBranchId, "VST_PRODUCT_BRANCH", ConstantJMS.EVENT_TYPE.VST_CHANGE_SELL_PRICE.name());
消费者：
1)DistTimePriceProcesser-》SyncTrigger:"VIRTUAL", "VST_CHANGE_SELL_PRICE_UPDATE", "superDataSource", "UPDATE",
-》触发VstTimePriceLogic.updateVstSearchLowestPrice(Long.valueOf(st.getFieldOne()),st.getFieldTwo());	

2)Message.isVSTChangeSellPriceMsg() 似乎不像，是TNT的代码

3)Message.isVSTProductGoodsChangeForNewApiMsg() 似乎不像，是TNT的代码

4)TntProductServiceImpl 似乎不像，是TNT的代码

*/
          
/*syncBaseService.saveSyncTrigger(prodProductId.toString(),
					"VIRTUAL", "RETURN_COMMISSION_CHANGE", "superDataSource", "UPDATE", buffer.toString(), "", prodProductId.toString());*/

