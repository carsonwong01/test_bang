<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dim"	uri="/dimeng-tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!--个人基础信息-->
<form  id="dataForm" method="post">
    <div class="p20">
        <div class="border">
            <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>用户信息</div>
            <div class="content-container pl40 pt30 pr40">
                <ul class="gray6 input-list-container clearfix">
                    <li><span class="display-ib mr5">基金会名称：</span>
                        <input type="text" name="foundationName" class="text border pl5 mr20" value="${req.foundationName }"/>
                    </li>
                    <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="controler.getPerInformationList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
                    <%--<li><a class="btn btn-blue radius-6 mr5 pl1 pr15" href="<%=basePath%>userManage/addHospitalUser.do"><i class="icon-i w30 h30 va-middle"></i>添加</a></li>--%>
                    <li><a class="btn btn-blue radius-6 mr5  pl1 pr15 click-link" data-url="userManage/addFoundationInfo.do" ><i class="icon-i w30 h30 va-middle add-icon"></i>新增</a><li>

                </ul>
            </div>
        </div>
        <div class="mt20 table-container">
            <table class="table table-style gray6 tc">
                <thead>
                <tr class="title">
                    <th class="tc">序号</th>
                    <th>基金会名称</th>
                    <th>登记管理机关</th>
                    <th>联系人</th>
                    <th>办公电话</th>
                    <th>手机号</th>
                    <th>联系邮箱</th>
                    <th>录入时间</th>
                    <th class="w200">操作
                    </th>
                </tr>
                </thead>
                <tbody class="f12" id="hosInformationId">
                </tbody>
            </table>
        </div>
        <!-- 导出 -->
        <%--<table id="exportTable" hidden="true">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th exp-name="index">序号</th>--%>
                <%--<th exp-name="userName">用户名</th>--%>
                <%--<th exp-name="nickName">昵称</th>--%>
                <%--<th exp-name="hospitalName">用户类型</th>--%>
                <%--<th exp-name="realName">真实姓名</th>--%>
                <%--<th exp-name="idCard">身份证</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
        <%--</table>--%>
        <!--分页-->
        <div class="paging clearfix pt20" id="paging"></div>
        <!--分页 end-->
    </div>

</form>

<script language="javascript" src="<%=basePath %>js/easy/user/foundation.js"></script>
<!--主体内容-->
<script id="perInformationTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
 			<tr>
	          <td class="tc">{{= i+1}}</td>
	           <td>{{= data.foundationName}}</td>
			  <td>{{= data.registrationInstitution}}</td>
			  <td>{{= data.linkName}}</td>
              <td>{{= data.officeTel}}</td>
	          <td>{{= data.linkMobile}}</td>
	          <td>{{= data.mail}}</td>
	          <td>{{= data.createTime}}{{= data.city}}</td>
	          <td class="tc">
				<shiro:hasPermission name="YHGL_YHXX_GRXX_CK">
    <a data-url="userManage/FoundationInfoDetail.do?foundationId={{= data.foundationId}}" class="link-blue mr20 click-link" >查看</a>
</shiro:hasPermission>

<shiro:hasPermission name="YHGL_YHXX_GRXX_CK">
    <a data-url="userManage/updateFoundationInfo.do?foundationId={{= data.foundationId}}" class="link-blue mr20 click-link" >编辑</a>
</shiro:hasPermission>

<%--<shiro:hasPermission name="YHGL_YHXX_GRXX_CK">--%>
    <%--<a href="javascript:void(0);" onclick="controler.articleGuideDel('{{= data.foundationId}}','{{= data.foundationName}}')" class="link-blue mr20 click-link" >删除</a>--%>
<%--</shiro:hasPermission>--%>

<shiro:hasPermission name="YHGL_YHXX_GRXX_SD">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.delFoundation('{{= data.foundationId}}','{{= data.foundationName}}','删除');">删除</a>
</shiro:hasPermission>

				</td>
	        </tr>
	{{/each}}
</script>

<%--<script type="text/javascript">--%>
    <%--var ArticleGuideController=DM.Controller.sub({--%>
        <%--articleGuideDel:function(val, title){--%>
        <%--var _self=this;--%>
            <%--Dialog.confirm({--%>
                <%--title:"删除确认",--%>
                <%--msg:"确认删除该内容吗？删除后将不可恢复！",--%>
                <%--picClass:"tip",--%>
                <%--showCancel:true,--%>
                <%--showClose:true,--%>
                <%--sureName:"确认",--%>
                <%--callBack:function(){--%>
                    <%--_self.toDel(val);//删除--%>
                <%--}--%>
            <%--});--%>
        <%--},--%>
        <%--//删除--%>
        <%--toDel:function(val){--%>
            <%--var _self=this;--%>
            <%--DM.ajax({--%>
                <%--url:"userManage/delFoundationInfo.do",--%>
                <%--data:{id:val},--%>
                <%--success:function(data){--%>
                    <%--if("000000" == data.code){--%>
                        <%--articleGuideController.loadRecord();--%>
                    <%--}--%>
                <%--},--%>
                <%--error:function(){--%>

                <%--}--%>
            <%--});--%>
        <%--},--%>
    <%--});--%>
    <%--var articleGuideController=new ArticleGuideController();--%>
    <%--DM.Page.ready({--%>
        <%--"加载数据":function(){--%>
            <%--articleGuideController.loadRecord();--%>

            <%--//绑定查询事件--%>
            <%--$("#searchAdvert").bind("click",function(){--%>
                <%--articleGuideController.loadRecord();--%>
            <%--});--%>
        <%--}--%>

    <%--});--%>

<%--</script>--%>





