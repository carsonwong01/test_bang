<!--主体内容-->	
   	<div class="sidemenu leftBox fl" data-num="${type}">
       	<ul id="aboutUsLeftMenu">
        </ul>
       <input type="hidden" id="review" value="${review}"> 
       </div>
       <form action="<%=basePath %>home/aboutUs.do" method="POST" id="aboutUsTypeFooterForm">
   	  		<input name="type" type="hidden" id="type">
   	  		<input name="title" type="hidden" id="title">
   	  	</form>
       
<!--主体内容-->

<!-- <li class="cur" data-type="{{= zd.type}}" title="{{= zd.title}}"><a  id="abtUs_{{= zd.type}}"   href="javascript:void(0)" name="menu" type="{{= zd.type}}" title="{{= zd.title}}" action="home/aboutUs.do?type={{= zd.type}}&title={{= zd.title}}"> -->
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script id="aboutUsLeftMenuTemple" type="text/x-jquery-tmpl">

{{each(i,zd) object}}
     {{if review!= 'true'}}
		{{if zd.status==1}}
        	<li id="cur_{{= zd.type}}" data-type="{{= zd.type}}" title="{{= zd.title}}">
        		<a  id="abtUs_{{= zd.type}}"   href="javascript:void(0)" name="menu" type="{{= zd.type}}" title="{{= zd.title}}" onclick="aboutUsLeftMenu.aboutUsTypeFooterClick('{{= zd.type}}');"><b
				class="btn-blue"></b> <span class="spbox"><i class="about-ico about-ico0{{= i+1}}"></i>
				{{if zd.title.length>6}}
					{{= zd.title.substring(0,6)}}...
				{{else}}
					{{= zd.title}}
				{{/if}}</span></a></li>
	    {{/if}}
    {{/if}}
	{{if review == 'true'}}
        <li class="active" data-type="{{= zd.type}}" title="{{= zd.title}}">
		<a  id="abtUs_{{= zd.type}}"  href="javascript:void(0)" name="menu" action=""><b class="btn-blue"></b> <span class="spbox">
			<i class="about-ico about-ico0{{= i+1}}"></i>
			{{if zd.title.length>6}}
				{{= zd.title.substring(0,6)}}...
			{{else}}
				{{= zd.title}}
			{{/if}}
		</span></a>
		</li>
	{{/if}}
{{/each}}
 </script>
 


<script language="javascript" src="<%=basePath %>easy/js/aboutUs/leftMainAbout.js"></script>

    