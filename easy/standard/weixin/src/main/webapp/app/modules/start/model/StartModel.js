
define(['commonClass/commonTools','Lib/md5'], function(Tools,MD5){
    var StartModel = DMJS.DMJSModel.extend({
        defaults: {
        },
        'commonData':{},
        initReturnProject:function(param){//创建回报项目
        	var urlKey="project.initReturnProject";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        modifyReturnProject:function(param){//编辑回报项目
        	var urlKey="project.modifyReturnProject";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        initDreamProject:function(param){//创建梦想项目
        	var urlKey="project.initDreamProject";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        modifyDreamProject:function(param){//编辑梦想项目
        	var urlKey="project.modifyDreamProject";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        initWelfareProject:function(param){//创建公益项目
        	var urlKey="project.initWelfareProject";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        modifyWelfareProject:function(param){//编辑公益项目
        	var urlKey="project.modifyWelfareProject";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        findLabels:function(param){//项目标签
        	var urlKey="project.findLabels";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        findImgModel:function(param){//项目验证示例图
        	var urlKey="project.findImgModel";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        proAuthenticated:function(param){//项目验证
        	var urlKey="project.proAuthenticated";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        proAuthenticatedDetail:function(param){//项目验证
        	var urlKey="project.proAuthenticatedDetail";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //项目详情页（项目详情内容）
        projectDetailsCon:function(param){
        	var urlKey="index.projectDetailsCon";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
    });
    return StartModel;
});
