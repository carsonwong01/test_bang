
define(['commonClass/commonTools','Lib/md5'], function(Tools,MD5){
    var TrendsModel = DMJS.DMJSModel.extend({
        defaults: {
        },
        'commonData':{},
        //项目动态
        projectDynamic:function(param){
        	var urlKey="index.projectDynamic";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //项目评论留言
        projectCommentList:function(param){
        	var urlKey="index.projectCommentList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
      //项目详情页（项目插入评论）
        insertComment:function(param){
        	var urlKey="index.insertComment";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        
    });
    return TrendsModel;
});
