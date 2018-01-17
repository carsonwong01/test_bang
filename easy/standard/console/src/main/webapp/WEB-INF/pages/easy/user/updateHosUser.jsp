<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/entryinformation.css">
<!--新手指南新增-->
<div class='base'>
<form method="post" id="mForm">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>医院基本信息</div>
    <div class='inpt'>
        <p>
            <span class="pr">
                <label><em class="red pr5">*</em>医院名称</label><input name='hospitalName' maxlength="25" validate='q' value='${updateHosUserInfo.hospitalName}' type="text" class='ibu'></span>
            <span class="pr">
                <label><em class="red pr5">*</em>医院类型</label><input name='hospitalType' maxlength="25" validate='q' value='${updateHosUserInfo.hospitalType}' type="text" class='ibu'></span>
        </p>
        <p>
            <label><em class="red pr5">*</em>医院级别</label>
            <span class="pr">
                <input name='hospitalGrade' validate='q' maxlength="20" value='${updateHosUserInfo.hospitalGrade}' type="text" validate='q'  class='ibu'></span>
            <label><em class="red pr5">*</em>医院地址</label>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>省</option>--%>
            <%--</select>--%>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>市</option>--%>
            <%--</select>--%>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>区/县</option>--%>
            <%--</select>--%>
            <span class="pr">
            <input name='province' validate='q' maxlength="20" type="text" value='${updateHosUserInfo.province}' placeholder="省" class='ibuu'></span>
            <span class="pr">
            <input name='city' validate='q' maxlength="20" type="text" value='${updateHosUserInfo.city}' placeholder="市" class='ibuu'></span>
            <span class="pr">
            <input name='county' validate='q' maxlength="25" type="text" value='${updateHosUserInfo.county}' placeholder="区/县" class='ibuu'></span>
            <input name='addr' maxlength="100" type="text" value='${updateHosUserInfo.addr}' placeholder="街道地址" class='upi'>
        </p>
    </div>
    <div class='impt pr'>
        <label class='fl'><em class="red pr5">*</em>医院资质证明</label>
        <img class='fl' id="show" src="${updateHosUserInfo.organizationAptitudeUrl}"></span>
        <p class='fl p-iut'>
            <input type="file"  name='aptitudeFile' value='' onchange="c()" id="file" >
            <span class='p-iusp'>选择图片</span></br></br>
            <span class='txt-po'>建议图片尺寸为：640*360</span>
        </p>
        <div class='clear'></div>
    </div >
    <div class='impt pr'>
        <label class='fl'><em class="red pr5">*</em>医院封面图片</label>
        <img class='fl' id="show1" src="${updateHosUserInfo.logoUrl}"></span>
        <p class='fl p-iut'>
            <input type="file" name='logoFile' value='' onchange="cover()" id="file1" >
            <span class='p-iusp'>选择图片</span></br></br>
            <span class='txt-po'>建议图片尺寸为：640*360</span>
        </p>
        <div class='clear'></div>
    </div >
    <div class='hostms pr'>
        <label><em class="red pr5">*</em>医院简介</label>
        <input type="text" validate='q' maxlength="500"  name='hospitalAbstract' value='${updateHosUserInfo.hospitalAbstract}'>
    </div>
    <div class='hosjj pr'>
        <label class='fl'><em class="red pr5">*</em>医院描述</label>
        <textarea class='fl' name='description' value='' >${updateHosUserInfo.description}</textarea>
        <div class='clear'></div>
    </div>
    <%--<li class="mb20">--%>
        <%--<div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>内容</span>--%>
            <%--<div class="pr tl clearfix">--%>
                <%--<div class="ww60 fl">--%>
                    <%--<textarea cols="100" rows="4" style="width:700px;height:300px;visibility:hidden;" class="border h200 ww100" validate="q" name="content" id="content"></textarea>--%>
                <%--</div>--%>
                <%--<div class="fl ww40"><span class="pl10 pr10 display-ib"></span></div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</li>--%>
    <div class='hostms pr'>
        <label><em class="red pr5">*</em>医院网址</label>
        <input type="text" validate='q' maxlength="100"  name='hospitalUrl' value='${updateHosUserInfo.hospitalUrl}'>
    </div>
    <div class='yes-ou'>
        <p class='fl'>
            <label><em class="red pr5">*</em>推荐</label>
            <select class='setp' name='recommendStatus'>
                <option value='1'>是</option>
                <option value='2'>否</option>
            </select>
        </p>
        <p class='fr'>
            <label><em class="red pr5">*</em>发布</label>
            <select class='setp' name='publishStatus'>
                <option value='1'>是</option>
                <option value='2'>否</option>
            </select>
        </p>
        <div class='clear'></div>
    </div>
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>医院联系人信息</div>
    <div class='inpt'>
        <p>
            <span class="pr"></span>
            <label><em class="red pr5">*</em>姓&nbsp;&nbsp;&nbsp;&nbsp;名</label><input name='linkName' maxlength="20" validate='q'  type="text" value='${updateHosUserInfo.linkName}' class='ibu'></span>
            <span class="pr">
            <label><em class="red pr5">*</em>办公电话</label><input name='officeTel' maxlength="30" validate='q'  type="text" value='${updateHosUserInfo.officeTel}' class='ibu'></span>
        </p>
        <p>
            <span class="pr">
            <label><em class="red pr5">*</em>手机号</label><input name='mobilePhone' maxlength="11" validate="q|m"  warning="手机号码格式不正确" type="text" class='ibu' value='${updateHosUserInfo.mobilePhone}'></span>
            <span class="pr">
            <label><em class="red pr5">*</em>电子邮箱</label><input name='hospitalMail' maxlength="50" validate='q'  type="text" class='ibu' value='${updateHosUserInfo.hospitalMail}'></span>
        </p>
    </div>
    <div class='but-sibm'>
        <a class="" id="updateHosUser" href="javascript:void(0);">提交</a>
        <%--<a onclick="" href="javascript:void(0);">提交</a>--%>
        <a onclick="javascript:void(0);" id="backHome"  class="btn-gray">取消</a>
    </div>
    <li class='ldr' datr='${updateHosUserInfo.userId}'></li>
</form>
</div>


<script type="text/javascript" src="<%=basePath%>js/easy/user/updateHospitalInfo.js"></script>

<script>
    var userId = $('.ldr').attr('datr');
//    alert(userId);
    $(document).ready(function(){
        $("#advertImage").uploadPreview({ Img: "showPic1" });//图片预览
    });

    DM.Page.ready({
        "初始化":function(){
            //ajax表单提交
            var controller=new AdvertImageRecord();
            DM.Util.ajaxForm({
                formId:"mForm",        //表单id
                url:"userManage/updateHospitalInfoAjax.do?userId="+userId,//后台处理地址
                success:controller.returnPageBasic  // 提交后的回调函数
            });
        }
    })

    $("#backHome").click(function(){
        myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));
    });

</script>
<script>
    function c () {
        var r= new FileReader();
        f=document.getElementById('file').files[0];

        r.readAsDataURL(f);
        r.onload=function (e) {
            document.getElementById('show').src=this.result;
        };
    }
    function cover () {
        var logo= new FileReader();
        f=document.getElementById('file1').files[0];

        logo.readAsDataURL(f);
        logo.onload=function (e) {
            document.getElementById('show1').src=this.result;
        };
    }
</script>

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


