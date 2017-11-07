<div class="fl">
	<div style="overflow-y: auto; height: 700px;height: 380px;">
		<div class="popup-content-container-2">
			<div class="p10">
				<div class="newtime-item-container lh24">
					<div class="newtime-item pl60 pr10 pr">
						<div class="tc w80 pa left0 top10 gray6">
							<img {{if headPicUrl==null || headPicUrl==
								""}} src="images/portrait.jpg" {{else}} src="{{= headPicUrl}}"
								{{/if}} class="p2 border" width="50" height="50">
						</div>
						<div class="ml20">
							<h4 class="tl pl5">
								<shiro:hasPermission name="YWGL_SHGL_PLGL_SC"><span class="fr gray9" style="word-wrap: break-word;"><a
									href="javascript:controler.toDeleteDialog('{{= orderId}}','','{{= userName}}');"
									class="link-blue ml10 mr10">全部删除</a></span></shiro:hasPermission><span class="gray9">{{= userName}}：<em>{{= tips}}</em></span>
							</h4>
							<p class="gray6 tl p5" style="word-wrap: break-word;">{{=
								datePay}}</p>
						</div>
					</div>
					 <ul class="pl50">
						{{each(i,it) data.list}}
							{{if i>0}}
						          <div id="{{= it.id}}"> 
						            <div class="newtime-item pl10 pr80 pr">
						              
						              <div class="tc w80 pa right0 top-10 gray6 mb30"><shiro:hasPermission name="YWGL_SHGL_PLGL_SC"><a href="javascript:controler.toDeleteDialog('','{{= it.id}}');" class="link-blue ml10 mr10">删除</a></shiro:hasPermission></div>
						              <div class="ml20">
						                <h4 class=" tl"><span class="fr gray9">{{= it.dateReply}}</span><span class="gray9"><em class="blue">{{= it.reUserNickName}}</em></span></h4>
						                <p class="gray6 tl p5" style="word-wrap: break-word;">{{=
																	it.userName}}{{if it.replyUserName!=null &&
																	it.replyUserName!=""}} 回复 {{= it.replyUserName}}{{/if}}：<em>{{=
																		it.content}}</em></p>
						              </div>
						            </div>
						          </div>	
				          {{/if}}
						{{/each}}
			        </ul>
				</div>

			</div>

		</div>
	</div>
</div>