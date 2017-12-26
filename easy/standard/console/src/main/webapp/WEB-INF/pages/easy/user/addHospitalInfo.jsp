<html>
<head>
    <title>录入信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/easy/user/css/public.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/easy/user/css/entryinformation.css">
    <script type="text/javascript" src='<%=basePath%>/js/easy/user/jquery.min.js'></script>
</head>
<body>
<div class='base'>
    <form action="url" method="get">
        <div class='utop'>医院基本信息</div>
        <div class='inpt'>
            <p>
                <label>＊医院名称</label><input name='' value='' type="text" class='ibu'>
                <label>＊医院类型</label><input name='' value='' type="text" class='ibu'>
            </p>
            <p>
                <label>＊医院名称</label><input name='' value='' type="text" class='ibu'>
                <label>＊医院类型</label>
                <select class='setp'name=''>
                    <option value=''>省</option>
                </select>
                <select class='setp'name=''>
                    <option value=''>市</option>
                </select>
                <select class='setp'name=''>
                    <option value=''>区</option>
                </select>
                <input name='' type="text" value='' placeholder="街道地址" class='upi'>
            </p>
        </div>
        <div class='impt'>
            <label class='fl'>＊医院照片</label>
            <img class='fl' id="show"></span>
            <p class='fl p-iut'>
                <input type="file" name='' value='' onchange="c()" id="file" >
                <span class='p-iusp'>选择图片</span></br></br>
                <span class='txt-po'>建议图片尺寸为：640*360</span>
            </p>
            <div class='clear'></div>
        </div >
        <div class='hostms'>
            <label>＊医院描述</label>
            <input type="text" name='' value=''>
        </div>
        <div class='hosjj'>
            <label class='fl'>＊医院简介</label>
            <textarea class='fl' value='' name=''></textarea>
            <div class='clear'></div>
        </div>
        <div class='hostms'>
            <label>＊医院网址</label>
            <input type="text" name='' value=''>
        </div>
        <div class='yes-ou'>
            <p class='fl'>
                <label>＊推荐</label>
                <select class='setp' name=''>
                    <option value='1'>是</option>
                    <option value='2'>否</option>
                </select>
            </p>
            <p class='fr'>
                <label>＊发布</label>
                <select class='setp' name=''>
                    <option value='1'>是</option>
                    <option value='2'>否</option>
                </select>
            </p>
            <div class='clear'></div>
        </div>
        <div class='utop'>医院联系人信息</div>
        <div class='clla'>
            <p>
                <label>＊姓&nbsp;&nbsp;&nbsp;名</label><input name='' type="text" value='' class='ibu'>
                <label>＊办公电话</label><input name='' type="text" value='' class='ibu'>
            </p>
            <p>
                <label>＊手机号</label><input name='' type="text" class='ibu' value=''>
                <label>＊电子邮箱</label><input name='' type="text" class='ibu' value=''>
            </p>
        </div>
        <div class='but-sibm'>
            <button>确定</button>
            <a href="javascript :;" onClick="javascript :history.back(-1);">取消</a>
        </div>

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
</script>
</body>
</html>