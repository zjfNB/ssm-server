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
                <form action="${ctx}/xm/exUpdate2" method="post" id="myform" name="myform" enctype="multipart/form-data">
                
                 <input type="hidden" name="id" value="${obj.id}">
                 
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th><i class="require-red">*</i>工作：</th>
                            <td>
                                <select name="work" id="teacherTitle" class="required" style = "width:100px;" onChange="getCity()">
                                    <c:if test="${obj.work == null || obj.work == ''}">
                                        <option value="-1">请选择工作</option>
                                        <option value="监考" >监考</option>
                                        <option value="论文">论文</option>
                                        <option value="授课">授课</option>
                                    </c:if>
                                    <c:if test="${obj.work == '监考'}">
                                        <option value="-1">请选择工作</option>
                                        <option value="监考" selected="selected">监考</option>
                                        <option value="论文">论文</option>
                                        <option value="授课">授课</option>
                                    </c:if>
                                    <c:if test="${obj.work == '论文'}">
                                        <option value="-1">请选择工作</option>
                                        <option value="监考" >监考</option>
                                        <option value="论文" selected="selected">论文</option>
                                        <option value="授课">授课</option>
                                    </c:if>
                                    <c:if test="${obj.work == '授课'}">
                                        <option value="-1">请选择工作</option>
                                        <option value="监考" >监考</option>
                                        <option value="论文">论文</option>
                                        <option value="授课" selected="selected">授课</option>
                                    </c:if>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>工作类型：</th>
                            <td>
                                <SELECT name="workType" id="workType" style = "width:100px;">
                                    <OPTION VALUE="${obj.workType}">${obj.workType}</OPTION>
                                </SELECT>
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>开始时间：</th>
                            <td>
                                <input type="text" name="beginDate" class='ECalendar' id="ECalendar_date"  value="${obj.beginDate}"/>
                                  </td>
                        </tr>


                        <tr>
                                <th><i class="require-red">*</i>工作名称：</th>
                                <td>
                                    <input class="common-text required" id="title" name="name" size="50" value="${obj.name }" type="text" disabled="disabled">
                                </td>
                        </tr>
                         <tr>
                                <th>>工作说明：</th>
                                <td><textarea name="content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10">${obj.content }</textarea></td>
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
    //定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
    var city=[
        ["公共课","专业课","实验课"],
        ["一类论文","二类论文"],
        ["公共课","专业课","实验课"]
    ];

    function getCity(){
        //获得省份下拉框的对象
        var sltProvince=document.myform.work;
        //获得城市下拉框的对象
        var sltCity=document.myform.workType;

        //得到对应省份的城市数组
        var provinceCity=city[sltProvince.selectedIndex - 1];

        //清空城市下拉框，仅留提示选项
        sltCity.length=0;

        //将城市数组中的值填充到城市下拉框中
        for(var i=0;i<provinceCity.length;i++){
            //Option(选项描述，选项值) 等价于 <option value="选项值" >选项描述</option>;
            sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);
        }
    }
    $(function(){
        $("#ECalendar_date").ECalendar({
            type:"date",   //模式，time: 带时间选择; date: 不带时间选择;
            stamp : false,   //是否转成时间戳，默认true;
            offset:[0,2],   //弹框手动偏移量;
            format:"yyyy-mm-dd",   //时间格式 默认 yyyy-mm-dd hh:ii;
            skin:3,   //皮肤颜色，默认随机，可选值：0-8,或者直接标注颜色值;
            step:10,   //选择时间分钟的精确度;
            callback:function(v,e){} //回调函数
        });
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