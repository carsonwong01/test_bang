<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/foundation.css">
<div class='center'>
    <div class='bender cent-nav'>
        <div>
            <li class='fu-logo'>
                <img src="${foundationDetails.certificateUrl}">


            </li>
            <li class="fu-name">
                <p>基金会名称</p>
            </li>
        </div>

    </div>
    <div class='cent-nav'>
        <!-- 基金会信息 -->
        <div class='navc'>
            <span>基金会信息</span>
        </div>
        <div class='xin-x'>
            <div class='fl'>
                <p><span class='sp'>登记管理机关</span>${foundationDetails.registrationInstitution}</p>
                <p><span class='sp'>社会信用代码</span>${foundationDetails.socialCreditCode}</p>
                <p><span class='sp'>联系地址</span>${foundationDetails.address}</p>
            </div>
            <div class='fl'>
                <p><span>开户名称</span>${foundationDetails.foundationName}</p>
                <p><span>开户银行</span>${foundationDetails.bankInfo}</p>
                <p><span>开户账号</span>${foundationDetails.accountInfo}</p>
            </div>
            <div class='fl'>
                <p><span>联系电话</span>${foundationDetails.officeTel}</p>
                <p><span>电子邮箱</span>${foundationDetails.mail}</p>
                <p><span>网址</span>${foundationDetails.foundationUrl}</p>
            </div>
            <div class='clear'></div>
        </div>
        <div class='pft14'>
            <p>${foundationDetails.content}</p>
        </div>
        <div class='xgzj'>
            <p><i></i><span>相关证件</span></p>
            <div class='jih'>
                <div class='fl'>
                    <img src="${foundationDetails.certificateUrl}"></br></br>
                    <span>慈善组织登记证书扫描件</span>
                </div>
                <div class='fr'>
                    <img src="${foundationDetails.donationsQualificationUrl}"></br></br>
                    <span>公开捐募资格证书扫描件</span>
                </div>
                <div class='clear'></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath %>js/public/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public/vue.js"></script>
<script type="text/javascript">
    $(function(){
        $(".clik>ul>li").click(function(){
            if(!$(this).hasClass('actionk')){
                $(this).addClass('actionk').siblings('li').removeClass('actionk');
                $($(this).attr('data')).css('display','block').siblings('div').css('display','none')
            }
        })
    });
    /*分页*/
    var newlist = new Vue({
        el: '#app',
        data: {
            current_page: 1, //当前页
            pages: 50, //总页数
            changePage:'',//跳转页
            nowIndex:0
        },
        computed:{
            show:function(){
                return this.pages && this.pages !=1
            },
            pstart: function() {
                return this.current_page == 1;
            },
            pend: function() {
                return this.current_page == this.pages;
            },
            efont: function() {
                if (this.pages <= 7) return false;
                return this.current_page > 5
            },
            ebehind: function() {
                if (this.pages <= 7) return false;
                var nowAy = this.indexs;
                return nowAy[nowAy.length - 1] != this.pages;
            },
            indexs: function() {

                var left = 1,
                    right = this.pages,
                    ar = [];
                if (this.pages >= 7) {
                    if (this.current_page > 5 && this.current_page < this.pages - 4) {
                        left = Number(this.current_page) - 3;
                        right = Number(this.current_page) + 3;
                    } else {
                        if (this.current_page <= 5) {
                            left = 1;
                            right = 7;
                        } else {
                            right = this.pages;

                            left = this.pages - 6;
                        }
                    }
                }
                while (left <= right) {
                    ar.push(left);
                    left++;
                }
                return ar;
            },
        },
        methods: {
            jumpPage: function(id) {
                this.current_page = id;
            },
        },

    })
</script>