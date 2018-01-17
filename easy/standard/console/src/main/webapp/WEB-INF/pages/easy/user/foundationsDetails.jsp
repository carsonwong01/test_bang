<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/entryinformation.css">
<div class="border">
    <div class="tabnav-container">
        <ul class="clearfix pr pr100">
            <li class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>基金会基本信息</li>
            <li class="pa right0 top5 mr5"><a class="btn-blue2 btn white radius-6 pl20 pr20 f14 click-link" href="javascript:void(0);" id="backHome">返回</a></li>
        </ul>
    </div>
    <div class="per_li clearfix" style="font-size: 14px;">
        <ul>
            <li><b>登记管理机关：</b>${foundationInfo.registrationInstitution}</li>
            <li><b>社会信用代码：</b>${foundationInfo.socialCreditCode}</li>
            <li><b>联系地址：</b>${foundationInfo.address}</li>
        </ul>
        <ul>
            <li><b>开户名称：</b>${foundationInfo.foundationName}</li>
            <li><b>开户银行：</b>${foundationInfo.bankInfo}元</li>
            <li><b>开户账号：</b>${foundationInfo.accountInfo}</li>
        </ul>
        <ul>
            <li><b>联系电话：</b>${foundationInfo.officeTel}</li>
            <li><b>电子邮箱：</b>${foundationInfo.mail}</li>
            <li><b>网址：</b>${foundationInfo.foundationUrl}</li>
        </ul>
    </div>
    <div class="per_li clearfix" style="font-size: 14px;">
        <ul>
            <li>
                <li><b>基金会描述：</b></li>
                <li>${foundationInfo.description}</li>
            </li>
        </ul>
    </div>
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>相关证件</div>
    <div class="per_li clearfix">
        <ul>
            <div class='impt'>
                <label class='fl'><b>基金会logo</b></label>
                <img class='fl' id="show1" src="${foundationInfo.logoUrl}"></span>
                <label class='fl'><b>登记证书扫<br>描件</b></label>
                <img class='fl' id="show" src="${foundationInfo.certificateUrl}"></span>
                <label class='fl'><b>公开募捐资<br>格证书</b></label>
                <img class='fl' id="show2" src="${foundationInfo.donationsQualificationUrl}"></span>
                <div class='clear'></div>
            </div >
        </ul>
    </div>
    <li class='ldr' datr='${foundationInfo.foundationId}'></li>
</div>
<script>
//    var foundationId = $('.ldr').attr('datr');
    //    alert(foundationId);
//    DM.Page.ready({
//        "初始化":function(){
//            //ajax表单提交
//            var controller=new AdvertImageRecord();
//            DM.Util.ajaxForm({
//                formId:"mForm",        //表单id
//                url:"userManage/updateFoundationInfoAjax.do?foundationId="+foundationId,//后台处理地址
//                success:controller.returnPageBasic  // 提交后的回调函数
//            });
//        }
//    })
    $("#backHome").click(function(){
        myfn.AjaxFn("userManage/listFoundation.do",$(".viewFramework-content"));
    });
</script>
