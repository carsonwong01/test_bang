<!--用户详细信息-->
<div class="p20">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>用户信息</div>
    <div class="per_li clearfix" id="UserStatisticsId">
    </div>
  </div>
  <form id="dataForm">
	  <input type="hidden" name="userId" id="userId" value="${id}">
	  <input type="hidden" name="type" id="type" >
  </form>
  <!--切换栏目-->
  <div class="border mt20">
    <div class="tabnav-container">
      <ul class="clearfix pr pr100">
       <!--  <li><a href="javascript:void(0);" class="tab-btn select-a" onclick="$('#type').val(1)">用户信息<i class="icon-i tab-arrowtop-icon"></i></a></li> -->
        <li><a href="javascript:void(0);" class="tab-btn select-a" onclick="controler.getInitiateProList();">发起的项目<i class="icon-i tab-arrowtop-icon"></i></a></li>
        <li><a href="javascript:void(0);" class="tab-btn" onclick="controler.getSupportProList();">支持的订单</a></li> 
        <li class="pa right0 top5 mr5"><a class="btn-blue2 btn white radius-6 pl20 pr20 f14 click-link" href="javascript:void(0);" data-url="userManage/perInformation.do" >返回</a></li>
      </ul>
    </div>
    <div class="tab-content-container p20"> 
      
      <!--个人信息
      <div class="tab-item" >
        <div class="children-title-container">
          <h3 class="h30 lh30 gray6 fb" >
          	<shiro:hasPermission name="YHGL_YHXX_GRXX_XG">
		          <a data-url="userEstate/perInformationDetails.do?userId=${id}&type=1" class="link-blue mr20 click-link fr">
		          </a>基本信息
	        </shiro:hasPermission>
          </h3>
        </div>
        <div class="border p20" >
          <ul class="gray9 input-list-container clearfix" id="personalInformationId">
          </ul>
        </div> 
        
      </div>
      -->
        <!--发起的项目-->
      <div class="tab-item">
      <form id="initiateForm">
      	 <input type="hidden" name="id" value="${id}">
	      <div class="content-container pl40 pt30 pr40">
		     <ul class="gray6 input-list-container clearfix">
		        <li><span class="display-ib mr5">项目编号：</span>
		          <input type="text" id="proNum" name="proNum" class="text border pl5 mr20" value="${FindProListByUserIdReq.proNum }"/>
		        </li>
		       <li><span class="display-ib mr5">项目名称：</span>
		          <input type="text" id="proName" name="proName" class="text border pl5 mr20" value="${FindProListByUserIdReq.proName }"/>
		        </li>
		        <li><span class="display-ib mr5">项目类型：</span>
		         <select class="border mr20 h32 mw100" id="proType" name="proType">
		            <option value="">全部</option>
		            <option value="0">个人求助</option>
		            <option value="6">产品急销</option>
		             <option value="7">实现梦想</option>
		          </select> 
		        </li> 
		        <li><span class="display-ib mr5">状态：</span>
		            <select class="border mr20 h32 mw100" id="proStatus" name="proStatus">
			            <option value="">全部</option>
			            <option value="1">众筹中</option>
			            <option value="2">众筹成功</option>
			            <option value="3">众筹失败</option>
			             <option value="4">已删除</option>
			          </select>
		        </li>  
		        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="controler.getInitiateAjaxList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
		      </ul> 
	    </div> 
	  </form>
        <div class="table-container">
          <table class="table table-style gray6 tc">
            <thead>
              <tr class="title">
                <th>序号</th>
                <th>项目编号</th>
                <th>项目名称</th>
                <th>项目类型</th>
                <th>筹资目标（元）</th>
                <th>筹资期限（天）</th>
                <th>已筹金额（元）</th>
                <th>支持人次</th>
                <th>项目状态</th>
                <th>创建时间</th>
              </tr>
            </thead>
            <tbody class="f12" id="initiateProId">
            </tbody>
          </table>
        </div>
        <!--分页-->
        <div class="paging clearfix pt20" id="initiateProPageId"></div>
        <!--分页 end--> 
      </div>
       
      <!--支持的订单-->
      <div class="tab-item hide">
        <form id="supportForm">
      	 <input type="hidden" name="userId" value="${id}">
	      <div class="content-container pl40 pt30 pr40">
			     <ul class="gray6 input-list-container clearfix">
			        <li><span class="display-ib mr5">订单编号：</span>
			          <input type="text" name="orderId" id="orderId" class="text border pl5 mr20" value="${FindPaymentListReq.orderId }"/>
			        </li>
			       <li><span class="display-ib mr5">项目编号：</span>
			          <input type="text" name="projectNo" id="projectNo" class="text border pl5 mr20" value="${FindPaymentListReq.projectNo }"/>
			        </li>
			        <li><span class="display-ib mr5">项目类型：</span>
		         <select class="border mr20 h32 mw100" id="projectType" name="projectType">
		            <option value="">全部</option>
		            <option value="0">个人求助</option>
		            <option value="6">产品急销</option>
		            <option value="7">实现梦想</option>
		          </select> 
		        </li> 
		        <li> 
		        	<div class="item-box">
							<span class="display-ib mr5">订单状态：</span> <select
								class="border mr20 h32 mw100" id="status" name="status">
								<option value="">全部</option>
								<option value="3">已支付</option>
								<option value="9">支付失败</option>
								<option value="4">待发货</option>
								<option value="5">待收货</option>
								<option value="6">已收货</option>
								<option value="7">待退款</option>
							
								<option value="8">已退款</option> 
							</select>
					 </div>
					</li> 
			        <li><span class="display-ib mr5">订单时间：</span> 
				          <input class="text border pl5 w120 date" type=text name="beginTime" id="beginTime" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})"  > 
				         <span class="pl5 pr5">至</span>
				         <input class="text border pl5 w120 mr20 date" type=text name="endTime" id="endTime" onclick="WdatePicker({minDate: '#F{$dp.$D(\'beginTime\')}'})">
				    </li>
			        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="controler.getSupportAjaxList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
			      </ul> 
		    </div>
      </form>
        <div class="table-container">
          <table class="table table-style gray6 tc">
            <thead>
              <tr class="title">
                <th>序号</th>
                <th>订单编号</th>
                <th>支持金额（元）</th>
                <th>支持的项目</th>
                <th>项目类型</th>
                <th>项目状态</th>
                <th>订单时间</th>
                <th>订单状态</th> 
              </tr>
            </thead>
            <tbody class="f12" id="supportProId">
            </tbody>
          </table>
        </div>
        <!--分页-->
        <div class="paging clearfix pt20" id="supportProPagetId"></div>
        <!--分页 end--> 
      </div>
       
  </div>
</div>
</div>


<!--信息填充-->
<script id="UserStatisticsTemplate" type="text/x-jquery-tmpl">
		<div class="per_img"> 
		{{if  headUrl !="isNull"}}
				<img src="{{= headUrl}}">
			 {{else}}
				<img src="<%=basePath %>images/user.jpg">
		{{/if}} 
		</div>
 		    <ul>
 				<li>用户名：{{= userName}}</li>
				<li>可用金额：{{= availableMoney}}元</li> 
				<li>支持项目</li>
				<li>发起项目</li>
            </ul>
            <ul>
				<li>真实姓名：{{= realName}}</li> 
				<li>冻结金额：{{= freezeMoney}}元</li> 
				<li>累计支持金额：{{= supportAmt}}元</li>		
				<li>累计众筹总额：{{= crowdFundingAmt}}元</li> 
            	
            </ul>
            <ul>
				<%--<li>性别： --%>
					<%--{{if sex=="1"}}男{{/if}}--%>
					<%--{{if sex=="2"}}女{{/if}}--%>
				<%--</li> --%>
				<li>身份证号：{{= idCard}}</li>
				<li>累计提现金额：{{= withdrawAmt}}元</li>
				<li>累计支持次数：{{= supportCount}}次</li> 
				<li>累计众筹成功数：{{= crowdFundingCount}}个</li>
   			</ul>
 			<%--<ul>--%>
				<%--<li>身份证号：{{= idCard}}</li>--%>
   		   <%--</ul>--%>
</script>


<!--个人信息表单填充
<script id="personalInformationTemplate" type="text/x-jquery-tmpl">
			<li><span class="display-ib mr5">真实姓名：</span><span class="display-ib mr40 gray3">{{= realName}}</span></li>
            <li><span class="display-ib mr5">性别：</span>
			<span class="display-ib mr40 gray3">
			{{if sex=="1"}}男{{/if}}
			{{if sex=="2"}}女{{/if}}
			</span>
			</li>
            <li><span class="display-ib mr5">身份证：</span><span class="display-ib mr40 gray3">{{= idCard}}</span></li>
            <li><span class="display-ib mr5">手机号：</span><span class="display-ib mr40 gray3">{{= phoneNumber}}</span></li>
            
</script>
 --> 

<!--发起记录填充框-->
<script id="initiateProTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) pageResult.list}}
			<tr>
                <td>{{= i+1}}</td>
                <td>
 					<a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.proId}}&type={{= data.type}}&entry=wfqxm&extraParameter={{= data.userId}}" target="_blank" class="link-blue mr20" >{{= data.proNum}}</a>
				</td>
                <td>{{= data.title}}</td>
				 <td>
		 		 	{{if data.type<="5"}}    
	     				 个人求助
	      			{{/if}}
		   			{{if data.type=="6"}}        
	                                                   产品急销
	     	    	{{/if}}
   		   		    {{if data.type=="7"}}       
	       	 			实现梦想
	     		    {{/if}}
          		</td>
				<td format=2>{{= data.targetAmount}}</td> 
 				<td>{{= data.financingDays}}</td>  
				<td format=2>{{= data.raisedAmount}}</td> 
 				<td>{{= data.supportNumber}}</td> 
				<td>
				    {{if data.proStatus<="1"}}    
	     				 众筹中
	      			 {{/if}}
		   			{{if data.proStatus=="2"}}        
	          	             	  众筹成功
	     			 {{/if}}
   		   			{{if data.proStatus=="3"}}       
	       				众筹失败
	      			{{/if}}
		  			{{if data.proStatus=="4"}}       
	       			 已删除
	      			{{/if}}
          		</td> 
 				<td>{{= data.createTime}}</td>
 				
              </tr>
	{{/each}}
</script> 
<!--支持记录列表填充-->
<script id="supportProTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) pageResult.list}}
			  <tr>
                <td>{{= i+1}}</td>
                <td><a href="<%=basePath %>bus/orderManage/orderDetail.do?orderNo={{= data.orderId}}&entry=wzcdd&extraParameter={{= data.userId}}" target="_blank" class="link-blue mr20" >{{= data.orderId}}</a></td>
 				<td format=2>{{= data.supportAmt}}</td> 
                <td>
					<a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.projectId}}&type={{= data.projectType}}&entry=wfqxm&extraParameter={{= data.userId}}" target="_blank" class="link-blue mr20" >{{= data.projectNo}}</a>
 				</td>
                <td>
		 		 	{{if data.projectType<="5"}}    
	     				 个人求助
	      			{{/if}}
		   			{{if data.projectType=="6"}}        
	                                                   产品急销
	     	    	{{/if}}
   		   		    {{if data.projectType=="7"}}       
	       	 			实现梦想
	     		    {{/if}}
          		</td>
               	<td>
				    {{if data.projectStatus<="1"}}    
	     				 众筹中
	      			 {{/if}}
		   			{{if data.projectStatus=="2"}}        
	          	             	  众筹成功
	     			 {{/if}}
   		   			{{if data.projectStatus=="3"}}       
	       				众筹失败
	      			{{/if}}
		  			{{if data.projectStatus=="4"}}       
	       			 已删除
	      			{{/if}}
          		</td> 
				<td>{{= data.payTime}}</td>
				<td>   
					{{if data.payStatus=="3"}}       
	       				 已支付
					{{/if}}
					{{if data.payStatus=="9"}}       
	       				支付失败
					{{/if}}
					{{if data.payStatus=="4"}}       
	       				 待发货
					{{/if}}
					{{if data.payStatus=="5"}}       
	       				待收货
					{{/if}}
					{{if data.payStatus=="6"}}       
	       				 已收货
					{{/if}}
					{{if data.payStatus=="7"}}       
	       				待退款
					{{/if}}
					{{if data.payStatus=="8"}}       
	       				 已退款
					{{/if}}
					
				</td> 
              </tr>
	{{/each}}
</script>  
<script language="javascript" src="<%=basePath %>js/easy/user/perInformationDetails.js"></script>


