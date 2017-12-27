<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easy/user/css/entryinformation.css">
<!--新手指南新增-->
<div class='base'>
<form method="post" id="mForm">
    <div class='utop'>医院基本信息</div>
    <div class='inpt'>
        <p>
            <label>＊医院名称</label><input name='hospitalName' value='' type="text" class='ibu'>
            <label>＊医院类型</label><input name='hospitalType' value='' type="text" class='ibu'>
        </p>
        <p>
            <label>＊医院级别</label><input name='hospitalGrade' value='' type="text" class='ibu'>
            <label>＊医院地址</label>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>省</option>--%>
            <%--</select>--%>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>市</option>--%>
            <%--</select>--%>
            <select name="province" regionId="" class="select_style province"></select>
            <select id="hospitalRegionId" name="hospitalRegionId" class="select_style city"></select>
            <%--<select class='setp'name=''>--%>
            <%--<option value=''>区/县</option>--%>
            <%--</select>--%>
            <input name='county' type="text" value='' placeholder="区/县" class='ibuu'>
            <input name='addr' type="text" value='' placeholder="街道地址" class='upi'>
        </p>
    </div>
    <div class='impt'>
        <label class='fl'>＊医院资质证明</label>
        <img class='fl' id="show"></span>
        <p class='fl p-iut'>
            <input type="file" name='' value='' onchange="c()" id="file" >
            <span class='p-iusp'>选择图片</span></br></br>
            <span class='txt-po'>建议图片尺寸为：640*360</span>
        </p>
        <div class='clear'></div>
    </div >
    <div class='impt'>
        <label class='fl'>＊医院封面图片</label>
        <img class='fl' id="show1"></span>
        <p class='fl p-iut'>
            <input type="file" name='' value='' onchange="cover()" id="file1" >
            <span class='p-iusp'>选择图片</span></br></br>
            <span class='txt-po'>建议图片尺寸为：640*360</span>
        </p>
        <div class='clear'></div>
    </div >
    <div class='hostms'>
        <label>＊医院简介</label>
        <input type="text" name='hospitalAbstract' value=''>
    </div>
    <div class='hosjj'>
        <label class='fl'>＊医院描述</label>
        <textarea class='fl' value='' name='description'></textarea>
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
    <div class='hostms'>
        <label>＊医院网址</label>
        <input type="text" name='hospitalUrl' value=''>
    </div>
    <div class='yes-ou'>
        <p class='fl'>
            <label>＊推荐</label>
            <select class='setp' name='recommendStatus'>
                <option value='1'>是</option>
                <option value='2'>否</option>
            </select>
        </p>
        <p class='fr'>
            <label>＊发布</label>
            <select class='setp' name='publishStatus'>
                <option value='1'>是</option>
                <option value='2'>否</option>
            </select>
        </p>
        <div class='clear'></div>
    </div>
    <div class='utop'>医院联系人信息</div>
    <div class='clla'>
        <p>
            <label>＊姓&nbsp;&nbsp;&nbsp;名</label><input name='linkName' type="text" value='' class='ibu'>
            <label>＊办公电话</label><input name='officeTel' type="text" value='' class='ibu'>
        </p>
        <p>
            <label>＊手机号</label><input name='mobilePhone' type="text" class='ibu' value=''>
            <label>＊电子邮箱</label><input name='hospitalMail' type="text" class='ibu' value=''>
        </p>
    </div>
    <div class='but-sibm'>
        <a class="" onclick="addUser()">提交</a>
        <a onclick="javascript:void(0);" id="backHome"  class="">取消</a>
    </div>
    <%--<div class="pr mh30 pl120"><span class="display-ib"><em class="red pr5">*</em>标题</span>--%>
        <%--<div class="pr">--%>
            <%--<input type="text" class="focus_text"  validate="q" name="title" id=""  maxlength="20">--%>
        <%--</div>--%>
    <%--</div>--%>
</form>
</div>
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
<script type="text/javascript" language="javascript">
    var type = "${type}";
    if("1" == type)
        $("#detailHtml").html("新增发起项目相关问题");
    else if("2" == type)
        $("#detailHtml").html("新增项目管理相关问题");
    else if("3" == type)
        $("#detailHtml").html("新增支持项目相关问题");
    else if("4" == type)
        $("#detailHtml").html("新增常见问题");

    //增加校验模式
    dmCheck.init("#mForm");
    function addUser(){
        if(!dmCheck.check("#mForm")){
            return false;
        }
        //提交数据
        DM.ajax({
            url:"userManage/addHospitalUserAjax.do",
            type:"post",
            data:$('#mForm').serialize(),
            success:function(data){
                //显示提示信息
                if("000000"==data.code){
                    Dialog.show("新增成功","success");
                    myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));
                } else if(data.code=='600007'){
                    Dialog.show("保存失败，输入的文章內容过大","error");
                } else{
                    Dialog.show(data.description,"error");
                }
            },
            error:function(){
                Dialog.show("新增失败","error");
            }});
    }

    $("#backHome").click(function(){
        /*if(dmCheck.check("#projectForm")){
        }*/
        myfn.AjaxFn("userManage/hospitalUserList.do",$(".viewFramework-content"));

    });
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
