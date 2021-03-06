
define(function(){
 	var codeData = {
 		"000002":"操作数据库错误",
 		"000007":"验证码不正确",
	    "000010":"验证码已失效",
	    "200001":"未登录，用户需要登录",
	    "200002":"用户名或密码有误，请重试",
	    "200003":"用户无权限操作",
	    "200004":"验证码无效或超时",
	    "200005":"用户密码不能为空",
	    "200006":"提现密码不正确",
	    "200007":"登录密码不正确",
	    "200009":"身份证号码已认证过",
	    "2000092":"用户已实名认证",
	    "200010":"用户不存在",
	    "200011":"未设置提现密码",
	    "200012":"手机号是否认证",
	    "200013":"是否实名认证",
	    "200018":"邮箱已存在",
	    "200019":"手机号码已存在",
	    "200020":"用户名已存在",
	    "200021":"邮箱不存在",
	    "200022":"手机号码不存在",
	    "200024":"用户已被锁定",
	    "2000101":"信息有误，实名认证失败",
	    "2000075":"用户未实名认证",
	    "200041":"收货地址个数已达到上限",
	    "200042":"用户已被锁定,请联系客服人员！",
	    "200043":"密码错误次数已达上限",
	    "200044":"该用户未提交个人投资人认证",
	    "200045":"该机构未提交机构投资人认证",
	    "200046":"该用户未提交领投人认证",
	    "200047":"该用户没有申请领投人的条件",
	    "200048":"该用户没有注册第三方",
	    "200049":"该投资案例不存在",
	    "200050":"身份证号码不合法",
	    "200051":"未调用第三方",
	    "200052":"调用第三方",
	    "200053":"用户已有启用或待审核绑卡",
	    "200054":"用户认证第三方次数达到上限",
	    "200055":"银行卡不存在",
	    "200056":"机构用户未机构认证",
	    "200057":"个人已第三方认证",
	    "200058":"机构已第三方认证",
	    "200059":"用户名不符合规范",
	    "200090":"验证码验证已达最大次数！",
	    "200091":"验证码已失效，请重新获取 ！",
	    "2000060":"原始密码不能和新密码一样",
	    "2000061":"该用户还有逾期未发货的订单",
	    "2000062":"登录被踢出或登录超时",
	    "2000063":"该银行卡号已经被添加",
	    "2000064":"用户已经点赞或关注",
	    "2000095":"该第三方账户已被绑定，请更换其它账户",
	    "2000100":"用户手机号已绑定过第三方",
	    "200060":"实名认证错误达到当天最大值次数",
	    "200061":"实名认证错误达到最大值次数",
	    "300001":"通过订单ID无法查找到数据",
	    "300002":"通过KEY，无法查找到数据",
	    "300005":"订单操作失败",
	
        //后台 系统管理
	    "600000":"该类型的手机提醒已经存在",
	    "600001":"表单重复提交",
	
	    "560000":"资金账户不存在",
	    "560001":"账户余额不足",
	    "560002":"认投记录不存在",
	    "560003":"项目不存在",
	    "560004":"创建订单失败",
	    "560005":"提交订单失败",
	    "560006":"确认订单失败",
	    "560007":"更新订单失败",
	    "560008":"订单不存在",
	    "560009":"资金流水生成失败",
	    "560010":"更新账户资金失败",
	    "560011":"新增线下充值记录失败",
	    "560012":"充值记录审核失败",
	    "560013":"线下充值记录不存在",
	    "560014":"更新认投打款状态失败",
	    "560015":"更新项目打款金额失败",
	    "560016":"新增打款记录失败",
	    "560017":"更新议会制状态失败",
	    "560018":"提现额度不正确",
	    "560019":"投资人已打款",
	    "560020":"新增放款记录失败",
	    "560021":"更新项目已放款金额失败",
	    "560022":"恢复放款失败",
	    "560023":"项目恢复放款失败",
	    "560024":"生成退款记录失败",
	    "560025":"退款记录不存在",
	    "560026":"更新停止放款申请记录状态失败",
	    "560027":"更新项目已退款状态失败",
	    "560028":"更新项目状态失败",
	    "560029":"更新打款占比失败",
	    "560030":"机构账户还未激活",
	    "560031":"仿制人未打款",
	    "560032":"更新放款记录失败",
	    "560033":"认投对账失败",
	    "560034":"第在玟审核中",
	    "560035":"认投已撤销",
	    "560036":"充值金额额度不正确",
	    "560037":"更新打款时间失败",
	    "560038":"放款状态不正确",
	    "560039":"更新项目认投金额失败",
	    "560040":"撤销失败",
	    "560041":"打款失败",
	    "560042":"反悔失败",
	    "560043":"已经放款或者已经拒绝放款",
	    "560044":"项目通过失败，项目已通过或者已流标",
	    "560045":"该记录已退款或者已恢复放款",
	    "560046":"认投已反悔",
	    "560047":"认投已被拒绝",
	    "560048":"已确认认投",
	    "560049":"分红总金额必须大于0",
	    "560050":"已分红或者已经拒绝分红",
	    "560051":"项目已失败",
	    "560052":"该项目处于申请停止放款处理中，暂时不能进行放款操作",
	    "560053":"该项目已停止放款",
	    "560054":"该项目放款全部完成",
	    "560055":"该项目已退款",
	    "560056":"项目状态不正确",
	    "560057":"订单没有关联项目，是非法订单",
	    "560058":"多个项目的订单不能在一个批次中被处理",
	    "560059":"订单和项目不一致",
	    "560060":"订单中含有已退款的订单",
	    "560061":"认投已过冷静期",
	
	    "91009":"托管异常",
	    "91010":"订单不存在",
	    "91011":"第三方账号不存在",
	    "91012":"数据异常",
	    "91013":"充值金额不能小于等于0",
	    "91014":"认筹金额不能小于等于0",
	    "91015":"打款金额不能小于等于0",
	    "91016":"提现金额不能小于等于0",
	    "91017":"充值失败-查不到充值记录",
	    "91018":"充值对账-易宝异常",
	    "91019":"易宝升级，没有注册该业务",
	    "91020":"成功、对账成功或对账失败 不需要再次对账",
	    "91021":"对账失败-查不到提现记录",
	    "91029":"对账失败-查不到认投记录",
	    "91030":"对账失败-查不到分红记录",
	    "91022":"提现对账-易宝异常",
	    "91023":"对账成功，资金已确认转账",
	    "91024":"该用户已取消投资",
	    "91025":"与对账类型不符，不做处理",
	    "91026":"认投对账失败-查不到认投记录",
	    "91027":"对账成功，资金已确认转账",
	    "91028":"该用户已取消打款",
	    "91111":"签名异常",
	    "92222":"参数异常",
	    "92223":"订单已处理",
	    "90000":"正常",
	    "91500":"托管失败",
	    "91502":"预约解绑已经成功，认证中，请勿重复提交申请",
	    "91501":"分红对象不明确",
	    "99998":"源记录不存在",
	    "99999":"失败",
	    "92224":"订单处理中",
	
	    "100001":"数据添加错误",
	    "100002":"数据删除错误",
	    "100003":"数据更新错误",
	    "100004":"数据查询错误",
	
	    "400001":"项目正在预热中",
	    "400002":"用户已经认投过",
	    "400003":"用户已经申请认投过",
	    "400004":"用户未谁对应认投资格",
	    "400005":"用户未申请认投过该项目",
	    "400006":"项目认投金额达到上限",
	    "400007":"申请认投状态有误，申请失效或已取消",
	    "400008":"申请认投项目有误，项目无法进行认投",
	    "400009":"项目没有项目领投人，无法开标",
	    "400010":"只能对认投期项目进行该操作",
	    "400011":"项目评价不能为空",
	    "400012":"项目认投申请失败",
	    "400013":"发起人不能认投项目",
	    "400014":"认投金额超过最大可认投金额",
	    "400015":"认投金额小于最小可认投金额",
	    "400016":"项目已存在领投人，无法继续领投",
	    "400017":"延期失败，只有认筹中的项目可以延期",
	    "400018":"申请分红失败，申请人不是项目的发起人",
	    "400019":"申请金额不能大于待放款金额",
	    "400020":"项目已流标，无法再次进行流标操作",
	    "400021":"项目调账失败，项目未放首款或已放尾款",
	    "400022":"项目回报设置数量已达上限",
	    "400023":"项目放款审核失败，项目已放款全部完成或正在停止放款",
	    "400024":"融资期限最大输入999天",
	    "400025":"当天项目状态无法操作回报设置",
	    "400026":"申请放款金额不能大于放款最大金额",
	    "400027":"请勿重复申请放款",
	    "400028":"项目已暂停放款，无法继续申请放款",
	    "400029":"项目已停止放款，无法继续申请放款",
	    "400030":"项目已全部放款，无法继续申请放款",
	    "400031":"项目不存在或已审核",
	    "400032":"项目认投人数达到上限",
	    "400033":"项目已退款或已放款全部完成",
	    "400058":"请先支持项目",
	    "400062":"项目验证待审核中或项目验证已通过",
	    "400063":"项目筹集金额不能为零",
	    "400064":"收款人身份证和受助人身份证不能相同",
	
	    "700000":"手机号码或者邮件格式错误",
	    "700001":"发送时间间隔过短",
	    "700002":"验证码类型错误",
	    "700003":"验证码发送次数已达最大次数",
	    "700004":"ip地址验证码发送次数已达最大次数",
	    "700005":"模板内容为空",
	    "700006":"收件人为空",
	    "700007":"收件人邮箱地址不能为空",
	    "700008":"邮箱格式错误",
	    "700009":"手机号码格式错误",
	
	    "31000001":"缺少项目编号",
	    "31000002":"发起项目不能由后台用户发起",
	    "31000003":"用户认证信息未通过",
	    "31000004":"拉黑或锁定用户不能发起项目",
	    "31000005":"用户已经有草稿",
	    "31000006":"发起人在限定的时间内有主动取消项目的记录",
	    "31000007":"项目取消申请，状态限制",
	    "31000008":"项目修改申请，状态限制",
	    "31000009":"取消、修改项目申请只能由发起人操作",
	    "31000010":"项目操作、状态限制",
	    "31000011":"发起人的信用额度不足",
	    "31000012":"项目的所有订单状态不都是已收货或已退款",
	    "31000013":"项目的剩余金额为负数",
	    "31000014":"参数错误",
	    "31000015":"项目编号不存在或者该项目不满足终止项目的条件",
	    "31000016":"非发起人不能查看，未发布的项目",
	
	    "31000050":"该银行卡不是用户所绑定的银行卡",
	    "31000051":"该项目已经被删除",
	    "31000052":"该项目不是众筹中的项目",
	
	    "1000000":"记录不存在",
	    "1000015":"申请尾款必须首款放款成功",
	    "1000016":"项目首款审核失败，项目失败，不能够申请尾款",
	    "1000017":"项目已被终止",
	    "1000018":"放款重复申请",
	    "1000019":"不存在该方法",
	
	    "32000013":"项目已达到上限",
	    "32000021":"数据异常",
	    "32000022":"失败",
	    "32000023":"等待支付",
	    "32000024":"银行支付处理中",
	    "32000025":"订单未提交到通联",
	    "32000026":"退款订单失败",
	    "32000029":"订单退款对账失败",
	    "32000031":"订单退款对账失败",
	    "32000027":"退款中",
	    "32000028":"实名认证失败",
	    "32000030":"连接通联异常",
	    "32000001":"项目状态不是众筹中",
	    "32000002":"回报人数已达上限",
	    "32000003":"订单已存在投诉",
	    "32000004":"投诉状态不为投诉中",
	    "32000005":"支持订单用户不是个人",
	    "32000006":"用户当天订单已超过平台设置常量",
	    "32000007":"项目众筹已结束",
	    
	    "34000000":"行业名称已不存在",
	    "34000001":"项目参数错误",
	    "34000002":"超出行业最大记录条数",
	    "34000003":"超出标签设置最大记录条数",
	
	    //  后台站点管理模块错误码定义
	    "code2_600000":"项目状态不满足推荐条件",
	    "code2_600001":"该项目已经被推荐",
	    "code2_600003":"该项目不存在",
	
	    //线上、线下充值--
	    "code2_700000":"返回的json信息错误",
	    "code2_700001":"充值对账失败",
	    "code2_700002":"审核中",
 	};
 	
 	responseCode = function messge(code){
 		
 		return codeData[code]?codeData[code]:"系统异常，请联系客服人员!";
 	}
 	
 	 
	return responseCode;
});
