<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/entryinformation.css">
<script type="text/javascript">
    /*页面加载就开始执行*/
//    alert($("#provinceId").val());
    $(function(){
        $("#provinceId").change(function(){
            var pr=$(this).children('option:selected').val();
//    alert("pr:::"+pr);
            $('#list').html('');
            var list=$("#list");
            var str='';
            $.ajax({
                url:"<%=basePath %>userManage/findCity.do",
                type:"post",
                data:{province:pr},
            async:false,
                success:function(data){
                var data=data.list;
//    console.log(data);
                $.each(data,function(i,n){
                    str+="<option value="+n.city+">"+n.city+"</option>";
                });
               list.append(str);
            }
        })
        });
    })
</script>
<!--新增-->
<div class='base'>
<form method="post" id="mForm">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>医院基本信息</div>
    <div class='inpt'>
        <p>
            <span class="pr">
            <label><em class="red pr5">*</em>医院名称</label><input name='hospitalName'  value='' type="text" class='pr ibu' validate='q' maxlength="25">
            </span>
            <span class="pr">
                <label><em class="red pr5">*</em>医院类型</label><input name='hospitalType'  value='' type="text" class='pr ibu' validate='q' maxlength="25">
            </span>
        </p>
        <p>
            <span class="pr">
            <label><em class="red pr5">*</em>医院级别</label><input name='hospitalGrade' validate='q' value='' type="text" class='pr ibu' maxlength="20">
            </span>
            <span class="pr">
            <label><em class="red pr5">*</em>医院地址</label>
            <select name="province" class="setp" id="provinceId">
                <option value="" >请选择</option>
                <c:forEach items="${provinceList}" var="province">
                    <option value="${province.province}" >${province.province}</option>
                </c:forEach>
            </select>
            <select name="city" class="setp" id="list" >

            </select>
            <input name='county' maxlength="25" type="text" value='' placeholder="区/县" class='ibuu' validate='q'>
            <input name='addr' maxlength="100" type="text" value='' placeholder="街道地址" class='upi'>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>区/县</option>--%>
            <%--</select>--%>
            </span>
        </p>
    </div>
    <div class='impt pr'>
        <label class='fl'><em class="red pr5">*</em>医院资质证明</label>
        <img class='fl' id="show"></span>
        <p class='fl p-iut'>
            <input type="file" name="aptitudeFile" value='' onchange="c()" id="file">
            <span class='p-iusp'>选择图片</span></br></br>
            <span class='txt-po'>建议图片尺寸为：640*360</span>
        </p>
        <div class='clear'></div>
    </div >
    <div class='impt'>
        <label class='fl'><em class="red pr5">*</em>医院封面图片</label>
        <img class='fl' id="show1"></span>
        <p class='fl p-iut pr' >
            <input type="file" name="logoFile" value='' onchange="cover()" id="file1">
            <span class='p-iusp'>选择图片</span></br></br>
            <span class='txt-po'>建议图片尺寸为：640*360</span>
        </p>
        <div class='clear'></div>
    </div >
    <div class='hostms pr'>
        <label><em class="red pr5">*</em>医院简介</label>
            <input type="text" validate='q' name='hospitalAbstract' value='' maxlength="500">
    </div>
    <%--<div class='hosjj pr'>--%>
        <%--<label class='fl'><em class="red pr5">*</em>医院描述</label>--%>
        <%--<textarea class='fl' value='' validate='q' name='description'></textarea>--%>
        <%--<div class='clear'></div>--%>
    <%--</div>--%>
    <div class='hosjj pr'>
        <label class='fl'><em class="red pr5">*</em>医院描述</label>
        <textarea name='content' id="content" cols="100" rows="4" style="width:670px;height:300px;visibility:hidden;" class="border h200 ww100" validate="q"></textarea>
    </div>
    <div class='hostms pr'>
        <label><em class="red pr5">*</em>医院网址</label>
        <input type="text" name='hospitalUrl' value='' maxlength="100" validate='q'>
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
            <span class="pr">
                <label><em class="red pr5">*</em>姓&nbsp;&nbsp;&nbsp;&nbsp;名</label><input name='linkName' type="text" value='' class='ibu' maxlength="20" validate='q'>
            </span>
            <span class="pr">
                <label><em class="red pr5">*</em>办公电话</label><input name='officeTel' type="text" value='' class='ibu' maxlength="30" validate='q'>
            </span>
        </p>
        <p>
            <span class="pr">
                <label><em class="red pr5">*</em>手机号</label><input name='mobilePhone' validate="q|m"  warning="手机号码格式不正确" type="text" class='ibu' value='' maxlength="11">
            </span>
            <span class="pr">
                <label><em class="red pr5">*</em>电子邮箱</label><input name='hospitalMail' type="text" class='ibu' value='' maxlength="50" validate='q'>
            </span>
        </p>
    </div>
    <div class='but-sibm'>
        <a class="" id="addHosUser" href="javascript:void(0);">提交</a>
        <a onclick="javascript:void(0);" id="backHome"  class="btn-gray">取消</a>
    </div>
    <%--<div class="fl">--%>
        <%--<!--标题-->--%>
            <%--<ul class="gray6 pt50">--%>
                <%--<li class="mb20">--%>
                    <%--<div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>广告图片</span>--%>
                        <%--<div class="pr tl clearfix">--%>
                            <%--<div class="clearfix">--%>
                                <%--<img src="<%=basePath%>images/agency-icon-3.png" id="showPic1" class="border p2 fl mr10" width="160" height="160">--%>
                                <%--<div class="fl w400"><input type="file" name="logoFile" id="advertImage" class="ui-upload-input"/><span class="pl10 pr10 display-ib fl">最佳分辨率 PC端：1920px*500px APP端：750px*430px 支持jpg、png、jpeg格式</span></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--<div class="tl pl120 f16 pb20"><a href="javascript:void(0);" id="addHosUser" class="btn-blue2 btn white radius-6 pl20 pr20 ml20 mr20">发布</a><a href="javascript:void(0)" onclick="closeInfo()" class="btn btn-gray radius-6 pl20 pr20 ml20 mr20">取消</a></div>--%>
        <%--</div>--%>
    <%--</div>--%>
</form>
</div>
<script type="text/javascript" src="<%=basePath%>js/easy/user/addHospitalInfo.js"></script>
<script>
    $(document).ready(function(){
        $("#advertImage").uploadPreview({ Img: "showPic1" });//图片预览
    });

    DM.Page.ready({
        "初始化":function(){
            //ajax表单提交
            var controller=new AdvertImageRecord();
            DM.Util.ajaxForm({
                formId:"mForm",        //表单id
                url:"userManage/addHospitalUserAjax.do",//后台处理地址
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

<%--<script type="text/javascript" language="javascript">--%>
    <%--//增加校验模式--%>
    <%--dmCheck.init("#mForm");--%>
    <%--function addUser(){--%>
        <%--if(!dmCheck.check("#mForm")){--%>
            <%--return false;--%>
        <%--}--%>
        <%--//提交数据--%>
        <%--DM.ajax({--%>
            <%--url:"userManage/addHospitalUserAjax.do",--%>
            <%--type:"post",--%>
            <%--data:$('#mForm').serialize(),--%>
            <%--success:function(data){--%>
                <%--//显示提示信息--%>
                <%--if("000000"==data.code){--%>
                    <%--Dialog.show("新增成功","success");--%>
                    <%--myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));--%>
                <%--} else if(data.code=='600007'){--%>
                    <%--Dialog.show("保存失败，输入的文章內容过大","error");--%>
                <%--} else{--%>
                    <%--Dialog.show(data.description,"error");--%>
                <%--}--%>
            <%--},--%>
            <%--error:function(){--%>
                <%--Dialog.show("新增失败","error");--%>
            <%--}});--%>
    <%--}--%>
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
