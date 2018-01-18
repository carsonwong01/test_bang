<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/entryinformation.css">
<!--新手指南新增-->
<div class='base'>
    <form method="post" id="mForm">
        <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>基金会基本信息</div>
        <div class='inpt'>
            <p>
            <span class="pr">
            <label><em class="red pr5">*</em>基金会名称</label><input name='foundationName'  value='${updateFoundationInfo.foundationName}' type="text" class='pr ibu' validate='q' maxlength="50">
            </span>
                <span class="pr">
                <label><em class="red pr5">*</em>社会信用代码</label><input name='socialCreditCode'  value='${updateFoundationInfo.socialCreditCode}' type="text" class='pr ibu' validate='q' maxlength="18">
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
            <img class='fl' id="show1" src="${updateFoundationInfo.logoUrl}"></span>
            <p class='fl p-iut pr' >
                <input type="file" name="logoFile" value='' onchange="cover()" id="file1"  validate='q'>
                <span class='p-iusp'>选择图片</span></br></br>
                <span class='txt-po'>建议图片尺寸为：640*360</span>
            </p>
            <div class='clear'></div>
        </div >
        <div class='impt pr'>
            <label class='fl'><em class="red pr5">*</em>登记证书扫<br>&nbsp;&nbsp;描件</label>
            <img class='fl' id="show" src="${updateFoundationInfo.certificateUrl}"></span>
            <p class='fl p-iut'>
                <input type="file" name="certificateFile" value='' onchange="c()" id="file"  validate='q' >
                <span class='p-iusp'>选择图片</span></br></br>
                <span class='txt-po'>建议图片尺寸为：640*360</span>
            </p>
            <div class='clear'></div>
        </div >
        <div class='impt'>
            <label class='fl'><em class="red pr5">*</em>公开捐募资<br>&nbsp;&nbsp;格证书</label>
            <img class='fl' id="show2" src="${updateFoundationInfo.donationsQualificationUrl}"></span>
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
            <textarea name='content' id="content" cols="100" rows="4" style="width:670px;height:300px;visibility:hidden;"
                      class="border h200 ww100" validate="q">${updateFoundationInfo.content}</textarea>
            <div class='clear'></div>
        </div>
        <div class='hostms pr'>
            <label><em class="red pr5">*</em>开户行信息</label>
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
        <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>基金会联系人信息</div>
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
                <label><em class="red pr5">*</em>手机号</label><input name='linkMobile' type="text" class='ibu' value='${updateFoundationInfo.linkMobile}' maxlength="11" validate="q|m"  warning="手机号码格式不正确">
            </span>
                <span class="pr">
                <label><em class="red pr5">*</em>电子邮箱</label><input name='mail' type="text" class='ibu' value='${updateFoundationInfo.mail}' maxlength="50" validate='q'>
            </span>
            </p>
        </div>
        <div class='but-sibm'>
            <a class="" id="updateFoundation" href="javascript:void(0);">提交</a>
            <a onclick="javascript:void(0);" id="backHome"  class="btn-gray">取消</a>
        </div>
        <li class='ldr' datr='${updateFoundationInfo.foundationId}'></li>
    </form>
</div>


<script type="text/javascript" src="<%=basePath%>js/easy/user/updateFoundationInfo.js"></script>

<script>
    var foundationId = $('.ldr').attr('datr');
//    alert(foundationId);
    $(document).ready(function(){
        $("#advertImage").uploadPreview({ Img: "showPic1" });//图片预览
    });

    DM.Page.ready({
        "初始化":function(){
            //ajax表单提交
            var controller=new AdvertImageRecord();
            DM.Util.ajaxForm({
                formId:"mForm",        //表单id
                url:"userManage/updateFoundationInfoAjax.do?foundationId="+foundationId,//后台处理地址
                success:controller.returnPageBasic  // 提交后的回调函数
            });
        }
    })

    $("#backHome").click(function(){
        myfn.AjaxFn("userManage/listFoundation.do",$(".viewFramework-content"));
    });

</script>
<script>
    function c () {
        var r= new FileReader();
        f=document.getElementById('file').files[0];

        r.readAsDataURL(f);
        r.onload=function (e) {
            document.getElementById('show').src=this.result;
        }
    };
    function cover () {
        var logo= new FileReader();
        f=document.getElementById('file1').files[0];

        logo.readAsDataURL(f);
        logo.onload=function (e) {
            document.getElementById('show1').src=this.result;
        };
    };
    function donations () {
        var donations= new FileReader();
        f=document.getElementById('file2').files[0];

        donations.readAsDataURL(f);
        donations.onload=function (e) {
            document.getElementById('show2').src=this.result;
        }
    };
</script>
<%--<script type="text/javascript" language="javascript">--%>
    <%--var userId = $('.ldr').attr('datr');--%>
<%--//    alert(userId);--%>
    <%--//增加校验模式--%>
    <%--dmCheck.init("#mForm");--%>
    <%--function updateUser(){--%>
        <%--if(!dmCheck.check("#mForm")){--%>
            <%--return false;--%>
        <%--}--%>
        <%--//提交数据--%>
        <%--DM.ajax({--%>
            <%--url:"userManage/updateHospitalInfoAjax.do?userId="+userId,--%>
            <%--type:"post",--%>
            <%--data:$('#mForm').serialize(),--%>
            <%--success:function(data){--%>
                <%--//显示提示信息--%>
                <%--if("000000"==data.code){--%>
                    <%--Dialog.show("修改成功","success");--%>
                    <%--myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));--%>
                <%--} else if(data.code=='600007'){--%>
                    <%--Dialog.show("保存失败，输入的文章內容过大","error");--%>
                <%--} else{--%>
                    <%--Dialog.show(data.description,"error");--%>
                <%--}--%>
            <%--},--%>
            <%--error:function(){--%>
                <%--Dialog.show("修改失败","error");--%>
            <%--}});--%>
    <%--}--%>

    <%--$("#backHome").click(function(){--%>
        <%--/*if(dmCheck.check("#projectForm")){--%>
        <%--}*/--%>
        <%--myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));--%>

    <%--});--%>
<%--</script>--%>

<script type="text/javascript">
    var editor1;
    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="content"]', {
            uploadJson : basePath+'common/kingUpload.do',
            allowFileManager : false,
            formatUploadUrl : false,
            afterBlur : function() {
                this.sync();
                $("#content").text(this.html());
            },
            afterFocus : function() {
                $("#errContent").html("&nbsp;");
            },
            afterChange : function() {
                /* //限制字数
                var limitNum = 2000;  //设定限制字数
                var pattern = '还可以输入' + limitNum + '字';
                if(this.count('text') < limitNum) {
                    //计算剩余字数
                   var result = limitNum - this.count('text');
                   dmCheck.tip("textarea[name='content']",'还可以输入' +  result + '字');
                }else if(this.count('text') == limitNum){
                    dmCheck.tip("textarea[name='content']","最大允许输入"+limitNum+"字");
                } else {
                    //超过字数限制自动截取
                   var strValue = this.text();
                   strValue = strValue.substring(0,limitNum);
                   this.text(strValue);
                   dmCheck.tip("textarea[name='content']","最大允许输入"+limitNum+"字");
                } */
            }
        });
        prettyPrint();
    });
    initFocusText();
</script>
