<!--用户在线统计-->
<div class="p20">
  <form id="form">
    <div class="content-container mt30">
      <ul class="gray6 input-list-container clearfix">
      <li>
        <input type="text" name="startTime"  class="text border pl5 w120 mr15 date" id="date" onclick="WdatePicker({readOnly:true,maxDate:new Date()})" />
        </li>
        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="searchStatistics"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
      </ul>
    </div>
    </form>
    <div id="line" style="max-width: 800px; height: 400px; margin: 0 auto"></div>
</div>

<script type="text/javascript">
</script>
<script type="text/javascript" src="<%=basePath%>js/easy/statistics/userstatistics/userOnlineStatistics.js"></script>