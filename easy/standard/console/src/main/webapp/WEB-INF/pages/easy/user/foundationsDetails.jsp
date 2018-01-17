<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/entryinformation.css">
<!--新手指南新增-->
<div class='base'>
    <form method="post" id="mForm">
        <div class='utop'>基金会基本信息</div>
        <div class='inpt'>
            <p>
            <span class="pr">
            <label><em class="red pr5">*</em>基金会名称</label><input name='foundationName'  value='${updateFoundationInfo.foundationName}' type="text" class='pr ibu' validate='q' maxlength="50">
            </span>
                <span class="pr">
                <label><em class="red pr5">*</em>统一社会信用代码</label><input name='socialCreditCode'  value='${updateFoundationInfo.socialCreditCode}' type="text" class='pr ibu' validate='q' maxlength="18">
            </span>
            </p>
            <p>
            <span class="pr">
            <label><em class="red pr5">*</em>基金会地址</label><input name='address' validate='q' value='${updateFoundationInfo.address}' type="text" class='pr ibu' maxlength="100">
            </span>
                <span class="pr">
            <label><em class="red pr5">*</em>登记管理机关</label><input name='registrationInstitution' validate='q' value='${updateFoundationInfo.registrationInstitution}' type="text" class='pr ibu' maxlength="30">
            </span>
            </p>
        </div>
        <div class='impt'>
            <label class='fl'><em class="red pr5">*</em>基金会logo</label>
            <img class='fl' id="show1"></span>
            <p class='fl p-iut pr' >
                <input type="file" name="logoFile" value='' onchange="cover()" id="file1"  validate='q'>
                <span class='p-iusp'>选择图片</span></br></br>
                <span class='txt-po'>建议图片尺寸为：640*360</span>
            </p>
            <div class='clear'></div>
        </div >
        <div class='impt pr'>
            <label class='fl'><em class="red pr5">*</em>登记证书扫<br>&nbsp;&nbsp;描件</label>
            <img class='fl' id="show"></span>
            <p class='fl p-iut'>
                <input type="file" name="certificateFile" value='' onchange="c()" id="file"  validate='q' >
                <span class='p-iusp'>选择图片</span></br></br>
                <span class='txt-po'>建议图片尺寸为：640*360</span>
            </p>
            <div class='clear'></div>
        </div >
        <div class='impt'>
            <label class='fl'><em class="red pr5">*</em>公开募捐资<br>&nbsp;&nbsp;格证书</label>
            <img class='fl' id="show2"></span>
            <p class='fl p-iut pr' >
                <input type="file" name="donationsFile" value='' onchange="donations()" id="file2"  validate='q'>
                <span class='p-iusp'>选择图片</span></br></br>
                <span class='txt-po'>建议图片尺寸为：640*360</span>
            </p>
            <div class='clear'></div>
        </div >
        <div class='hostms pr'>
            <label><em class="red pr5">*</em>基金会网址</label>
            <input type="text" validate='q' name='foundationUrl' value='${updateFoundationInfo.foundationUrl}' maxlength="60">
        </div>
        <div class='hosjj pr'>
            <label class='fl'><em class="red pr5">*</em>基金会介绍</label>
            <textarea class='fl' value='' validate='q' name='description'>${updateFoundationInfo.description}</textarea>
            <div class='clear'></div>
        </div>
        <div class='hostms pr'>
            <label><em class="red pr5">*</em>基金会账户开户行信息</label>
            <input type="text" name='bankInfo' value='${updateFoundationInfo.bankInfo}' maxlength="50" validate='q'>
        </div>
        <div class='hostms pr'>
            <label><em class="red pr5">*</em>基金会账户</label>
            <input type="text" name='accountInfo' value='${updateFoundationInfo.accountInfo}' maxlength="20" validate='q'>
        </div>
        <div class='yes-ou'>
            <p class='fl'>
                <label><em class="red pr5">*</em>发票开具方式</label>
                <select class='setp' name='invoiceType'>
                    <option value='1'>电子发票</option>
                    <option value='2'>纸质发票</option>
                </select>
            </p>
            <div class='clear'></div>
        </div>
        <div class='utop'>基金会联系人信息</div>
        <div class='inpt'>
            <p>
            <span class="pr">
                <label><em class="red pr5">*</em>姓&nbsp;&nbsp;&nbsp;&nbsp;名</label><input name='linkName' type="text" value='${updateFoundationInfo.linkName}' class='ibu' maxlength="20" validate='q'>
            </span>
                <span class="pr">
                <label><em class="red pr5">*</em>办公电话</label><input name='officeTel' type="text" value='${updateFoundationInfo.officeTel}' class='ibu' maxlength="30" validate='q'>
            </span>
            </p>
            <p>
            <span class="pr">
                <label><em class="red pr5">*</em>手机号</label><input name='linkMobile' type="text" class='ibu' value='${updateFoundationInfo.linkMobile}' maxlength="11" validate='q'>
            </span>
                <span class="pr">
                <label><em class="red pr5">*</em>电子邮箱</label><input name='mail' type="text" class='ibu' value='${updateFoundationInfo.mail}' maxlength="50" validate='q'>
            </span>
            </p>
        </div>
        <div class='but-sibm'>
            <a onclick="javascript:void(0);" id="backHome"  class="btn-gray">取消</a>
        </div>
    </form>
</div>
<script>
    $("#backHome").click(function(){
        myfn.AjaxFn("userManage/listFoundation.do",$(".viewFramework-content"));
    });
</script>
