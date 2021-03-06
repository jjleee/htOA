<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<script src="<c:url value="/"/>datePicker/WdatePicker.js" language="JavaScript"></script>
	<script src="<c:url value="/"/>components/jquery-1.4.2.js" type="text/javascript"></script> <!--jquery包-->
	<script src="<c:url value="/"/>components/jqgrid/js/jquery-ui-1.8.2.custom.min.js" type="text/javascript"></script><!--jquery ui-->
	<script src="<c:url value="/"/>components/jquery.layout.js" type="text/javascript"></script><!--jquery 布局-->
	<script src="<c:url value="/"/>components/jqgrid/js/grid.locale-cn.js" type="text/javascript"></script> <!--jqgrid 中文包-->
	<script src="<c:url value="/"/>components/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script> <!--jqgrid 包-->
	<script src="<c:url value="/"/>js/inc_javascript.js"></script>
	<script src="<c:url value="/"/>js/commonFunction.js"></script>
	<script src="<c:url value="/"/>js/multisearch.js"></script> <!--加载模态多条件查询相关js-->
	
	<%--<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/"/>components/jqgrid/css/jquery-ui-1.7.2.custom.css" />--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/"/>css/base/jquery-ui-1.9.2.custom.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/"/>components/jqgrid/css/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/"/>components/jqgrid/css/tabstyle.css" />

<script type="text/javascript">
	//初始化列表和查询窗口Id
	var multiSearchParams = new Array();
	multiSearchParams[0] = "#listTopicInfor";			//列表Id
	multiSearchParams[1] = "#multiSearchDialog";//查询模态窗口Id



	
	function addPyTopicInfor(){
		var returnRolTag = window.showModalDialog("/extend/pyTopicInfor.do?method=edit",null,"dialogWidth:900px;dialogHeight:800px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(returnRolTag == "refresh") {
			//保存信息后重新加载tab
			//loadTab("listRole.jsp", "3");
			self.location.reload();
		}
	}
	
	//修改
	function editPyTopicInfor(rowId){
		var returnRolTag = window.showModalDialog("/extend/pyTopicInfor.do?method=edit&rowId="+rowId,'',"dialogWidth:900px;dialogHeight:800px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(returnRolTag == "refresh") {
			//保存信息后重新加载tab
			//loadTab("listRole.jsp", "3");
			self.location.reload();
		}
	}
	
	//设计
	function editPyItemInfor(rowId){
		var returnRolTag = window.showModalDialog("/extend/pyItemInfor.do?method=edit&rowId="+rowId,'',"dialogWidth:900px;dialogHeight:800px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(returnRolTag == "refresh") {
			//保存信息后重新加载tab
			//loadTab("listRole.jsp", "3");
			self.location.reload();
		}
	}
	//查看
	function doView(rowId){
		/** var refresh = window.showModalDialog("/meeting/meetInfor.do?method=viewMeeting&rowId="+rowId,'',"dialogWidth:900px;dialogHeight:700px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(refresh == "Y") {
			self.location.reload();
		} */
		window.open("/extend/pyPersonInfor.do?method=edit&rowId="+rowId, "_blank");
	}
	
	function view(rowId){
		/** var refresh = window.showModalDialog("/meeting/meetInfor.do?method=viewMeeting&rowId="+rowId,'',"dialogWidth:900px;dialogHeight:700px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(refresh == "Y") {
			self.location.reload();
		} */
		window.open("/extend/pyVoteInfor.do?method=viewpy&rowId="+rowId, "_blank");
	}
	
		
	function results(rowId){
		/** var refresh = window.showModalDialog("/meeting/meetInfor.do?method=viewMeeting&rowId="+rowId,'',"dialogWidth:900px;dialogHeight:700px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(refresh == "Y") {
			self.location.reload();
		} */
		window.open("/extend/pyTopicInfor.do?method=viewCount&rowId="+rowId, "_blank");
	}
	function details(rowId){
		/** var refresh = window.showModalDialog("/meeting/meetInfor.do?method=viewMeeting&rowId="+rowId,'',"dialogWidth:900px;dialogHeight:700px;center:Yes;dialogTop: 200px; dialogLeft: 300px;");
		if(refresh == "Y") {
			self.location.reload();
		} */
		window.open("/extend/pyTopicInfor.do?method=viewVoters&topicId="+rowId, "_blank");
	}
	
	function display(topicId,value){
		$.ajax({
			url: "/extend/pyTopicInfor.do?method=display&topicId="+topicId+"&homepage="+value,	
			cache: false,
			type: "POST",
			dataType: "html",
			beforeSend: function (xhr) {						
			},
				
			complete : function (req, err) {
				//alert("数据已经删除！");
				//self.location.reload();
				$("#listTopicInfor").trigger("reloadGrid"); 
			}
		});
	}
	
</script>

<title>评优投票</title>
<body style="border:1px solid #0DE8F5;border-radius: 5px">
	<div>
		<table id="listTopicInfor"></table> <!-- 信息列表 -->
		<div id="pagerTopicInfor"></div> <!-- 分页 -->
	</div>
	
	<!-- 查询框 -->
	<div id="multiSearchDialog" style="display: none;">  
	    <table>  
	        <tbody>  
	            <tr>  
		           <td>  
		              <input type="hidden" class="searchField" value="topicName"/>评优标题：
		              <input type="hidden" class="searchOper" value="cn"/>
		           </td>  
		           <td>  
		              <input type="text" class="searchString"/>  
		           </td>  
		        </tr>
		        
	        </tbody>  
	    </table>  
	</div>
</body>
	<script src="<c:url value="/"/>js/multisearch.js"></script> <!--加载模态多条件查询相关js-->		
	<script type="text/javascript"> 		
		
		//自定义操作栏的显示内容
	  
		//显示标题
		function formatTitle(cellValue, options, rowObject) {				
			var html = '';
			html = "<a href='javascript:;' onclick='view("+options.rowId+")'>" + cellValue + "</a>";				
			return html;
		}
		
			//自定义操作栏的显示内容
		function formatOperation(cellvalue, options, rowdata) {
		//alert(cellvalue);
		var returnStr=""
		 
		  if("${_SYSTEM_USER.userType == 1}" == 'true' || "${_TOPIC_OPERATOR}" == 'true'){
		        var returnStr = "<a href='javascript:;' onclick='editPyTopicInfor("+options.rowId+")'>[修改]</a>";
		      	returnStr = returnStr + "&nbsp;<a href='javascript:;' onclick='editPyItemInfor("+options.rowId+")'>[选项]</a>";
		      	returnStr = returnStr + "&nbsp;<a href='javascript:;' onclick='doView("+options.rowId+")'>[参评人]</a>";
		      	returnStr = returnStr + "&nbsp;<a href='javascript:;' onclick='results("+options.rowId+")'>[评优结果]</a>";
		      	returnStr = returnStr + "&nbsp;<a href='javascript:;' onclick='details("+options.rowId+")'>[评优详细]</a>";
		    
		      	if(rowdata.homepage){
		      		returnStr = returnStr + "&nbsp;<a href='javascript:;' onclick='display("+options.rowId+",false)'><font color='red'>[取消公示]</font></a>";
		      	}else{
		      		returnStr = returnStr + "&nbsp;<a href='javascript:;' onclick='display("+options.rowId+",true)'>[首页公示]</a>";
		      	}
	 	 }else{
				returnStr += "&nbsp;&nbsp;<a href='javascript:;' onclick='results("+options.rowId+")'><font color=blue>[查看评优结果]</font></a>";
			}
	        return returnStr;
	      
		 }
		 
		     //自定义状态栏的显示内容
	    function formatStatus(cellvalue) {
	           var returnStr;
	          //alert(jsonObj);
	           if (cellvalue) {
	              returnStr = "<font color='gray'>有效</font>";
	           }else {
	              returnStr = "无效";
	           }
	           return returnStr;
		    }
		    
	    
		//加载表格数据
		var $mygrid = jQuery("#listTopicInfor").jqGrid({
            url:'/extend/pyTopicInfor.do?method=list',
            //rownumbers: true,	//是否显示序号
            datatype: "json",   //从后台获取的数据类型              
           	autowidth: true,	//是否自适应宽度
			//height: "auto",
            height:document.documentElement.clientHeight-140,
            colNames:['Id','主题', '开始时间', '结束时间', '是否有效','操作'],//表的第一行标题栏
            //以下为每列显示的具体数据
            colModel:[
                {name:'topicId',index:'topicId', width:0, search:false, hidden:true, key:true},            
                {name:'topicName',index:'topicName', width:100, sortable:true, formatter:formatTitle,sorttype:"string"},
                {name:'startTime',index:'startTime', width:50,align:'center'},
                {name:'endTime',index:'endTime', width:50,align:'center'},
                {name:'valid',index:'valid', width:40,align:'center',formatter:formatStatus},
                {name:'fixed',  align:'center', search:false, sortable:false, formatter:formatOperation}
            ],
//            caption: "评优系统",
            sortname: 'topicId', //默认排序的字段
            sortorder: 'desc',	//默认排序形式:升序,降序
            multiselect: true,	//是否支持多选,可用于批量删除
            viewrecords: true,	//是否显示数据的总条数(显示在右下角)
            rowNum: 10,			//每页显示的默认数据条数
            rowList: [10,20,30],//可选的每页显示的数据条数(显示在中间,下拉框形式)
            scroll: false, 		//是否采用滚动分页的形式
            scrollrows: false,	//当选中的行数据隐藏时,grid是否自动滚               
            jsonReader:{
               repeatitems: false	//告诉JqGrid,返回的数据的标签是否是可重复的
            },         
            pager: "#pagerTopicInfor"	//分页工具栏
            //caption: "用户信息"	//表头
       	}).navGrid('#pagerTopicInfor',{edit:false,add:false,del:false,search:false}).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
		
		//自定义按钮
		if("${_SYSTEM_USER.userType == 1}" == 'true' || "${_TOPIC_OPERATOR}" == 'true'){
			jQuery("#listTopicInfor").jqGrid('navButtonAdd','#pagerTopicInfor', {
				caption:"新增", title:"点击新增信息", buttonicon:'ui-icon-plusthick', onClickButton: addPyTopicInfor
			});
			
			jQuery("#listTopicInfor").jqGrid('navButtonAdd','#pagerTopicInfor', {
				caption:"<span style='color: red;'>批量删除</span>", title:"点击批量删除", buttonicon:'ui-icon-closethick', onClickButton: deletePyTopicInfor
			});
		}
		jQuery("#listTopicInfor").jqGrid('navButtonAdd','#pagerTopicInfor', {
			caption:"查询", title:"点击查询", buttonicon:'ui-icon-search', onClickButton: openMultipleSearchDialog
		});
		
		//删除数据
		function deletePyTopicInfor(){
		
		doDelete("/extend/pyTopicInfor.do?method=delete","listTopicInfor");
			
		}

		
		/** 查询条件中的部门,班组,用户下拉联动 */
		//部门信息初始化
		$('#departmentId').selectInit();
		
		//加载部门及联动信息		
		$.loadDepartments("departmentId", null, "authorId");
		/** ******** */
		
	</script>