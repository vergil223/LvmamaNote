<script type="text/javascript">
var reg=/^[1-9]{1}\d*(\.\d{1})?$|^0(\.\d{1})?$/;
var str01="1.";
var str02="0.";
var str03="0";
var str1="0.1";//可以自己更换这个字符串的值进行所有可能的测试
var str2="1";
var str3="1.2";
var str4="1.20";
var str5="1.21";
var str6="1.25";
alert(str01+":"+reg.test(str01));
alert(str02+":"+reg.test(str02));
alert(str03+":"+reg.test(str03));
alert(str1+":"+reg.test(str1));//弹出true表示符合模式，弹出false表示不符合模式
alert(str2+":"+reg.test(str2));
alert(str3+":"+reg.test(str3));
alert(str4+":"+reg.test(str4));
alert(str5+":"+reg.test(str5));
alert(str6+":"+reg.test(str6));
</script>