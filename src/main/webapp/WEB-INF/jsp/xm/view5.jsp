<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
   <title>后台管理中心</title>  
    <script src="${ctx}/resource/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/main.css"/>
     <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
    <link rel="stylesheet" href="${ctx}/resource/css/reset.css" />
	<link rel="stylesheet" href="${ctx}/resource/css/style.css" />
	<script src="${ctx}/resource/js/Ecalendar.jquery.min.js"></script>
</head>
<body>

 <%@ include file="/common/top.jsp" %>
 
<div class="container clearfix">
     <%@ include file="/common/menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="">首页</a><span class="crumb-step">&gt;</span></div>
        </div>
          <!-- 
  	private String name;
	private Integer teacherId;
	private Teacher teacher;
	private String content;
	private Integer status; 0 新建 待审一 1 已审一待审二 2 已审二待审三 3 结束
	private Integer score;积分
	-->
        <div class="result-wrap">
            <div class="result-content">
                <form action="${ctx}/xm/exUpdate5" method="post" id="myform" name="myform" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${obj.id}">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        
                        <tr>
                                <th><i class="require-red">*</i>工作名称：</th>
                                <td>
                                    <input class="common-text required" id="title" name="name" size="50" value="${obj.name}" disabled="disabled" type="text">
                                </td>
                        </tr>

                        <tr>
                            <th><i class="require-red">*</i>工作：</th>
                            <td>
                                <input class="common-text required" id="work" name="name" size="50" value="${obj.work}" disabled="disabled" type="text">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>工作类型：</th>
                            <td>
                                <input class="common-text required" id="workType" name="name" size="50" value="${obj.workType}" disabled="disabled" type="text">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>开始时间：</th>
                            <td>
                                <input type="text" name="beginDate" class='ECalendar' id="ECalendar_date" disabled="disabled"  value="${obj.beginDate}"/>
                                  </td>
                        </tr>

                        <tr>
                                <th>工作说明：</th>
                                <td><textarea name="content" disabled="disabled"  class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10">${obj.content }</textarea></td>
                            </tr>
                            
                           <tr>
                                <th><i class="require-red">*</i>评价工作量：</th>
                                <td>
                                    <input class="common-text required" id="title1" name="score" size="50" value=""  type="text">
                                </td>
                        </tr>
                         <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
<script type="text/javascript">
		$(function(){
				$("#ECalendar_case1").ECalendar({
						 type:"date",
						 skin:"#233",
						 offset:[0,2]
				});
				$("#ECalendar_case2").ECalendar({
						 type:"time",
						 offset:[0,1]
				});
				$("#ECalendar_case3").ECalendar({
						 type:"date",
						 stamp:false,
						 skin:5,
						 format:"yyyy年mm月dd日",
						 callback:function(v,e)
						 {
							 $("#ECalendar_case3").val(v)
						 }
				});
		})
	</script>
</html>