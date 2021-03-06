<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<style type="text/css">
td {padding:3px;}
</style>
<title></title>
<%@include file="/common/ec.jsp" %>
<%@include file="/common/extjs.jsp" %>
<%@include file="/common/meta.jsp" %>
<script type="text/javascript" src="${ctx}/scripts/jqueryui/jquery-ui.js"></script>
<style type="text/css">
.ecSide .headZone {
    background-color: #fff;
    border-color: #333;
}

/*表格斜线*/ 
.out{ 
   border-top:50px #e3e3e3 solid;/*上边框宽度等于表格第一行行高*/ 
   width:0px;/*让容器宽度为0*/ 
   height:0px;/*让容器高度为0*/ 
   border-left:100px #fff solid;/*左边框宽度等于表格第一行第一格宽度*/     
   position:relative;/*让里面的两个子容器绝对定位*/ 
} 
b{font-style:normal;display:block;position:absolute;top:-40px;left:-40px;width:35px;} 
em{font-style:normal;display:block;position:absolute;top:-25px;left:-90px;width:55x;} 

</style>
</head>
<body>
<s:form id="removeForm" action="role/remove" method="POST"></s:form>
<div class="x-panel">
  <div class="x-panel-header">考核记录</div>
    <div class="x-toolbar" style="height:26px;">
      <table width="99%" >
  	  <tr style="margin-top:  7px;"> 		
  		<s:form name="queryForm" id="queryForm" namespace="/assess/evaluate" action="query" theme="simple">	    	
			<td width="10">
				<table style="padding-top: 3px;"> 
					<tr> 
						<td>
							单位名称：
							<!--<select name="deptCode">
								<option value="">请选择</option>
								<option value="130604">一大队</option>
								<option value="130603">二大队</option>
								<option value="130602">三大队</option>
								<option value="130641">四大队</option>
								<option value="130642">五大队</option>
								<option value="130643">六大队</option>								
							</select>
							--><s:select list="deptCodeList" id="deptCodeList" headerKey="" headerValue="请选择" 
                     	name="deptCode" listKey="key" listValue="value"  cssClass="m_t_b" 
                     	cssStyle="width:200px;padding-left:2px;"  ></s:select>
						</td> 
						<td>
						考核年月：
						<select name="year">
								<c:forEach begin="2011" end="2016" step="1" var="i">
									<option value="${i}" ${i eq year ? 'selected="selected"':'' }>${i}</option>
								</c:forEach>																				
						</select>
						年
						<select name="month">
								<c:forEach begin="1" end="12" step="1" var="i">
									<option value="${i}" ${i eq month ? 'selected="selected"':'' }>${i}</option>
								</c:forEach>												
						</select>
						</td>
						
					</tr> 
			</table> 
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type="submit" value="查询" class="button" style="margin-top: 3px;">			   			
		</td>	 
		</s:form>  	
		<td align="right">
		<table>
			<tr>
				<td><span class="ytb-sep"></span></td>
				<td>
					
				</td>
			</tr>
		</table>
		</td>	
  	  </tr>
  	</table>
   </div>   

   <div class="x-panel-body">
     <div style="margin-left:-3px;" align="center">
	<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
	action="index.htm"
	useAjax="true" doPreload="false"
	maxRowsExported="1000" 
	pageSizeList="20,50,100" 
	editable="false" 
	sortable="false"	
	rowsDisplayed="20"	
	generateScript="true"	
	resizeColWidth="true"	
	classic="false"	
	width="100%" 	
	height="500px"	
	minHeight="300" 
	showHeader="true"	
	toolbarContent="navigation|pagejump|pagesize|export|refresh|extend|status">    
	<ec:row>
	   	<ec:column width="30" property="_s" title="No." value="${GLOBALROWCOUNT}" sortable="false" style="text-align:center"/>
	   	<ec:column width="300" property="_8" title="考核年月" tipTitle="" ellipsis="true" sortable="false">
	   		${item.year}年${item.month}月
	   	</ec:column>
	    <ec:column width="100" property="dept.name" title="单位名称" tipTitle="" ellipsis="true" sortable="false"/>
	    <ec:column width="100" property="total" title="总分" tipTitle="" ellipsis="true" sortable="false"/>
			   	
	</ec:row>
	</ec:table>
  </div>
  </div>
</div>
<script type="text/javascript">
function remove(id) {
    /*Ext.MessageBox.confirm('提示','确认要删除此项目吗？删除后不能恢复！', function(btn){
        if (btn == 'yes') {
          window.location = "${ctx}/assess/transgress/statcfg/statItem/remove.htm?model.id=" + id;
        }
    });*/
    if(!confirm("确定要删除该任务类型吗?")){
        return;
    }
    window.location = "${ctx}/assess/evaluate/remove.htm?model.id=" + id;
}
</script>

</body>
</html>