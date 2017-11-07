<div class="popup-content-container-2">
	<div class="p30">
       <form id="adjustTmplForm">
		 <ul>
			   <li class="mb10">
					<div class="pr mh30 pl120 tl">
						<span class="display-ib w100 lh30 tr mr5 pa left0 top0">
						   <em class="red pr5">*</em>调账方式：
						</span>
						<p class="w400 lh30">
						   <input value="1" name="tradeType" type="radio" checked="checked"> 收入调账
						   <input value="2" name="tradeType" type="radio"> 支出调账
						</p>
					</div>
				</li>
				 <li class="mb10">
					<div class="pr mh30 pl120 tl">
						<span class="display-ib w100 lh30 tr mr5 pa left0 top0">
						   <em class="red pr5">*</em>调账金额：
						</span>
						<p class="w400 lh30">
						   <input  class='border ww60 h23 p5'  maxlength='10' validate="q|amount|nZero"  id="adjustAmount" type="text"> 元
						</p>
					</div>
				</li>
		        <li class="mb10">
					<div class="pr mh30 pl120 tl">
						<span class="display-ib w100 lh30 tr mr5 pa left0 top0">
						   备注：
						</span>
						<p class="w400 lh30">
						    <textarea class='border ww100 p5' style="height: 170px" maxlength='200' name="remarkId" id="remarkId"></textarea>
						</p>
						<p class='gray9 mt5'>200字以内</p>
					</div>
				</li>
		   </ul>
	   </form>
	</div>
</div>
