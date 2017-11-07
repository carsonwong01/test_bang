dmCheck.init("#projectForm");
var ProjectDreamController = DM.Controller.sub({
    init:function(){
        projectEditController.readyProject();
        
        //项目标签选择
        $("#labels li a").click(function(){
            if($(this).attr("class") == undefined || $(this).attr("class").indexOf("cur") < 0){
                if($("#labels a.cur").length == 2){
                    $($("#labels a.cur").get(0)).removeClass('cur');
                }
                $(this).addClass("cur");
            }else{
                $(this).removeClass("cur");
            }
            var value = ",";
            $("#labels a.cur").each(function(){
                value = value + $(this).html() + ",";
            });
            if(value == ",") value="";
            $("#projectLabel").val(value);
        });
        
        //确认添加目标
        $("#returnDialog #okBtn").click(function(){
            var obj = new Object();
            if(dmCheck.check("#returnForm")){
                obj.supportAmount=$("#supportAmount").val();
                obj.returnDescribe=$("#returnDescribe").val();
                if($(this).attr("data-status") == "add"){
                    //插入模板
                    $("#returnTmpl").tmpl(obj).appendTo("#returnUl");
                }
                if($(this).attr("data-status") == "edit"){
                    var $li = $("#returnUl .returnEdit");
                    $($li.find("input[data-name=supportAmount]")).val(obj.supportAmount);
                    $($li.find("input[data-name=returnDescribe]")).val(obj.returnDescribe);
                    $($li.find("#supportAmountB")).html(obj.supportAmount);
                    $($li.find("#returnDescribeP")).html(obj.returnDescribe);
                    $li.removeClass("returnEdit");
                }
                //关闭窗口
                $("#returnDialog").hide();
                //更新目标下标
                projectEditController.updateTargetSuffix();
            }
        });
    },
    /**
     * 新增目标
     */
    addReturnDialog:function(){
        var maxCount = eval($("#targetCountMax").val());
        if ($("#returnUl li") && $("#returnUl li").length >= eval(maxCount)) {
            Dialog.show("梦想目标个数达到上限！","error");
            return;
        }
        var $title = $("#returnDialog div.title");
        $title.html("");
        $title.append('<a href="#" class="out"></a>添加目标');
        $("#returnDialogContent").empty();
        $("#returnDialogTmpl").tmpl(null).appendTo("#returnDialogContent");
        $("#returnDialog #okBtn").attr("data-status","add");
        $("#returnDialog a.out, #returnDialog #cancelBtn").unbind("click").click(function(){
            //关闭窗口
            $("#returnDialog").hide();
        });
        $("#returnDialog").show();
        //初始化form校验
        dmCheck.init("#returnForm");
        //初始化input实时显示填写字数
        projectEditController.initCalculate($("#returnDescribe"));
    },
    /**
     * 修改目标
     */
    editReturnDialog:function(element){
        var obj = new Object();
        var $li = $(element).parent().parent("li");
        $li.addClass("returnEdit");
        obj.supportAmount = $($li.find("input[data-name=supportAmount]")).val();
        obj.returnDescribe = $($li.find("input[data-name=returnDescribe]")).val();
        
        var $title = $("#returnDialog div.title");
        $title.html("");
        $title.append('<a href="#" class="out"></a>修改目标');
        $("#returnDialogContent").empty();
        $("#returnDialogTmpl").tmpl(obj).appendTo("#returnDialogContent");
        $("#returnDialog #okBtn").attr("data-status","edit");
        $("#returnDialog a.out, #returnDialog #cancelBtn").unbind("click").click(function(){
            //关闭窗口
            $("#returnDialog").hide();
        });
        $("#returnDialog").show();
        //初始化form校验
        dmCheck.init("#returnForm");
        //初始化input实时显示填写字数
        projectEditController.initCalculate($("#returnDescribe"));
    },
    /**
     * 删除目标
     */
    deleteReturn:function(element){
        var $li = $(element).parent().parent("li");
        $li.remove();
        //更新目标下标
        projectEditController.updateTargetSuffix();
    }
});
//实例化控制器
var projectDreamController = new ProjectDreamController();
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		
	}
});