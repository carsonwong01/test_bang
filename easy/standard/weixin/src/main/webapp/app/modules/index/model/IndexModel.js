
define(['commonClass/commonTools','Lib/md5'], function(Tools,MD5){
    var IndexModel = DMJS.DMJSModel.extend({
        defaults: {
        },
        'commonData':{},
        //首页统计
        totalMessage:function(param){
        	var urlKey="index.totalMessage";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //首页推荐项目
        recommendList:function(param){
        	var urlKey="index.recommendList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //公告详情
       noticeDetail:function(param){
    	   var urlKey="index.noticeDetail";
       	this.commonRequest(_.extend({'urlKey':urlKey},param));
       },

        //项目详情页（项目详情内容）
        projectDetailsCon:function(param){
        	var urlKey="index.projectDetailsCon";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        
        //项目详情页（项目动态）
        projectDynamic:function(param){
        	var urlKey="index.projectDynamic";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //项目详情页（项目插入评论）
        insertComment:function(param){
        	var urlKey="index.insertComment";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        
        //项目详情页（支持评论）
        projectCommentList:function(param){
        	var urlKey="index.projectCommentList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //查询某项目所有项目验证审核列表
        authenticatedRecord:function(param){
        	var urlKey="project.authenticatedRecord";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //关注项目
        collect:function(param){
        	var urlKey="index.collect";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //举报项目
        inform:function(param){
        	var urlKey="index.inform";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //支持下单
        support:function(param){
        	var urlKey="index.support";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //支持下单订单支持结果
        supportOrderStatus:function(param){
        	var urlKey="index.supportOrderStatus";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //梦想回报列表详情
        findReturnOrDreamList:function(param){
        	var urlKey="index.findReturnOrDreamList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //获取标签
        findLabels:function(param){//项目标签
        	var urlKey="project.findLabels";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //获取收货地址
        findAddress:function(param){//获取收货地址
        	var urlKey="user.findAddress";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
    });
    return IndexModel;
});
