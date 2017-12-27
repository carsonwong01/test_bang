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
                    <li><span class="display-ib mr5">医院名称：</span>
                        <input type="text" name="hospitalName" class="text border pl5 mr20" value="${findUserListReq.hospitalName }"/>
                    </li>
                    <li><span class="display-ib mr5">医院类型：</span>
                        <input type="text" name="hospitalType" class="text border pl5 mr20" value="${findUserListReq.hospitalType }"/>
                    </li>
                    <li><span class="display-ib mr5">医院等级：</span>
                        <input type="text" name="hospitalGrade" class="text border pl5 mr20" value="${findUserListReq.hospitalGrade }"/>
                    </li>
                    <li><span class="display-ib mr5">所在地区：</span>
                        <input type="text" name="area" class="text border pl5 mr20" value="${findUserListReq.area }"/>
                    </li>
                    <li><span class="display-ib mr5">用户名：</span>
                        <input type="text" name="userName" class="text border pl5 mr20" value="${findUserListReq.userName }"/>
                    </li>
                    <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="controler.getPerInformationList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
                    <%--<li><a class="btn btn-blue radius-6 mr5 pl1 pr15" href="<%=basePath%>userManage/addHospitalUser.do"><i class="icon-i w30 h30 va-middle"></i>添加</a></li>--%>
                    <li><a class="btn btn-blue radius-6 mr5  pl1 pr15 click-link" data-url="userManage/addHospitalUser.do" ><i class="icon-i w30 h30 va-middle add-icon"></i>新增</a><li>

                </ul>
            </div>
        </div>
        <div class="mt20 table-container">
            <table class="table table-style gray6 tc">
                <thead>
                <tr class="title">
                    <th class="tc">序号</th>
                    <th>用户名</th>
                    <th>医院名称</th>
                    <th>医院类型</th>
                    <th>医院级别</th>
                    <th>联系电话</th>
                    <th>联系邮箱</th>
                    <th>所在省市</th>
                    <th>注册来源</th>
                    <th>状态</th>
                    <th>注册时间</th>
                    <th class="w200">操作
                    </th>
                </tr>
                </thead>
                <tbody class="f12" id="hosInformationId">
                </tbody>
            </table>
        </div>
        <!-- 导出 -->
        <table id="exportTable" hidden="true">
            <thead>
            <tr>
                <th exp-name="index">序号</th>
                <th exp-name="userName">用户名</th>
                <th exp-name="nickName">昵称</th>
                <th exp-name="hospitalName">用户类型</th>
                <th exp-name="realName">真实姓名</th>
                <th exp-name="idCard">身份证</th>

                <th exp-name="hospitalGrade">医院等级</th>
                <th exp-name="hospitalType">医院类型</th>
                <th exp-name="linkName">联系人</th>
                <th exp-name="mobilePhone">联系电话</th>
                <th exp-name="hospitalMail">医院邮箱</th>
                <th exp-name="officeTel">固定电话</th>
                <th exp-name="province">所在省</th>
                <th exp-name="city">所在市</th>

                <th exp-name="source">注册来源</th>
                <th exp-name="status">状态</th>
                <th exp-name="registerTime">注册时间</th>
            </tr>
            </thead>
        </table>
        <!--分页-->
        <div class="paging clearfix pt20" id="paging"></div>
        <!--分页 end-->
    </div>

</form>

<script language="javascript" src="<%=basePath %>js/easy/user/hosUserInfo.js"></script>
<!--主体内容-->
<script id="perInformationTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
 			<tr>
	          <td class="tc">{{= i+1}}</td>
	           <td>{{= data.userName}}</td>
			  <td>{{= data.hospitalName}}</td>
			  <td>{{= data.hospitalType}}</td>
              <td>{{= data.hospitalGrade}}</td>
	          <td>{{= data.officeTel}}</td>
	          <td>{{= data.hospitalMail}}</td>
	          <td>{{= data.province}}{{= data.city}}</td>
			  {{if data.source=="1"}}
	          	<td>PC</td>
	          {{/if}}
   			  {{if data.source=="2"}}
	          	<td>微信</td>
	          {{/if}}
			  {{if data.source=="3"}}
	          	<td>安卓</td>
	          {{/if}}
 			  {{if data.source=="4"}}
	          	<td>IOS</td>
	          {{/if}}
	          {{if data.status=="1"}}
	          <td>正常</td>
	          {{/if}}
	          {{if data.status=="2"}}
	          <td>锁定</td>
	           {{/if}}
 			  {{if data.status=="3"}}
	           <td>拉黑</td>
	           {{/if}}
 			  <td>{{= data.registerTime}}</td>
	          <td class="tc">
				<shiro:hasPermission name="YHGL_YHXX_GRXX_CK">
    <a data-url="userManage/userInfoDetail.do?userId={{= data.userId}}" class="link-blue mr20 click-link" >查看</a>
</shiro:hasPermission>


<shiro:hasPermission name="YHGL_YHXX_GRXX_CK">
    <a data-url="userManage/updateHosUserInfo.do?userId={{= data.userId}}" class="link-blue mr20 click-link" >编辑</a>
</shiro:hasPermission>

	 {{if data.recommendStatus=="1"}}
				<shiro:hasPermission name="YHGL_YHXX_GRXX_SD">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.recommend('2','{{= data.userId}}','取消推荐');">取消推荐</a>
</shiro:hasPermission>
				 {{/if}}
{{if data.recommendStatus=="2"}}
				<shiro:hasPermission name="YHGL_YHXX_GRXX_SD">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.recommend('1','{{= data.userId}}','推荐');">推荐</a>
</shiro:hasPermission>
				 {{/if}}


				 {{if data.status=="1"}}
				<shiro:hasPermission name="YHGL_YHXX_GRXX_SD">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.locking('2','{{= data.userId}}','锁定');">锁定</a>
</shiro:hasPermission>
				 {{/if}}

 				{{if data.status=="1"}}
				 <shiro:hasPermission name="YHGL_YHXX_GRXX_LH">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.locking('3','{{= data.userId}}','拉黑');">拉黑</a>
</shiro:hasPermission>
				 {{/if}}


	          	 {{if data.status=="2"}}
				<shiro:hasPermission name="YHGL_YHXX_GRXX_JS">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.locking('1','{{= data.userId}}','解锁');">解锁</a>
</shiro:hasPermission>
				 {{/if}}

 				{{if data.status=="3"}}
					<shiro:hasPermission name="YHGL_YHXX_GRXX_JH">
    <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.locking('1','{{= data.userId}}','取消拉黑');">取消拉黑</a>
</shiro:hasPermission>
 				{{/if}}

				</td>
	        </tr>
	{{/each}}
</script>



