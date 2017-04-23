<%@ page language="java"
	import="com.github.pagehelper.PageInfo,com.jkxy.demomaven.domain.SearchResult"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>搜索</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet" media="all" href="css/defaults.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/system.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/system-menus.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/style.css" />

<script>
	function formSubmit(pageNo) {
		if (document.getElementById("keyWord").value == "") {
			alert("请输入查询关键字");
		} else {
			document.getElementById("pageNo").value = pageNo;
			document.getElementById("searchForm").submit();
		}
	}
</script>
</head>
<body>

<div id="header-region" class="clear-block"></div>
	<div id="wrapper">
		<div id="container" class="clear-block">
			<div id="header">
				<div id="logo-floater"></div>
			</div>
			<div id="center">
				<div id="squeeze">
					<div class="right-corner">
						<div class="left-corner" style="text-align: center;">
							<h2>全唐诗搜索引擎</h2>
							<div class="clear-block">
								<div id="node-2" class="node">
									<div class="content clear-block">
										
										<form id="searchForm" method="get" action="poetry.html">
											<input class="searchTxt" type="text" name="keyWord" id="keyWord"
												value="${keyWord }" /><input type="button" onclick="formSubmit(1)"
												value="查询" /><br /> <br /> <input type="radio" name="filterType"
												value="1" checked="checked"
												<c:if test="${filterType==1 || filterType==0}"></c:if> />作者名称&nbsp;&nbsp;
											<input type="radio" name="filterType" value="2"
												<c:if test="${filterType==2 }">checked="checked"</c:if> />诗歌名称&nbsp;&nbsp;
											<input type="radio" name="filterType" value="3"
												<c:if test="${filterType==3 }">checked="checked"</c:if> />诗歌名句&nbsp;&nbsp;
											<input type="hidden" name="pageNo" id="pageNo" value="" />
										</form>
										<hr />
										<c:if test="${page.pageNum!=null }">
											<h4>第 -${page.pageNum }- 页</h4>
										</c:if>
									
										<c:if test="${page.hasPreviousPage }">
											<a class="jumpbtn" href="javascript:formSubmit(${page.prePage });">上一页</a>
										</c:if>
									
										<c:forEach var="pn" items="${page.navigatepageNums }">
											&nbsp;&nbsp;<a class="pgbtn"
												<c:if test="${pn==page.pageNum }">style="background:#ddd"</c:if>
												href="javascript:formSubmit(${pn });">${pn }</a>&nbsp;&nbsp;
										</c:forEach>
									
										<c:if test="${page.hasNextPage }">
											<a class="jumpbtn" href="javascript:formSubmit(${page.nextPage });">下一页</a>
										</c:if>
									
										<c:if test="${page.pages==1 }">
											<h4>只有一页</h4>
										</c:if>
									
										<c:if test="${page.total==0 }">
											<h4>----没有数据----</h4>
										</c:if>
									
										<hr />
										<hr />
									
										<c:forEach var="pl" items="${page.list }" varStatus="pls">
											<div <c:if test="${pls.index%2==0 }">class="bgcColum"</c:if>>
												《${pl.poetryTitle }》 · ${pl.poetName }<br /> <br />
												${pl.poetryContent }<br />
											</div>
										</c:forEach>
									
										<hr />
										<c:if test="${page.pageNum!=null }">
											<h4>第 -${page.pageNum }- 页</h4>
										</c:if>
									
										<c:if test="${page.hasPreviousPage }">
											<a class="jumpbtn" href="javascript:formSubmit(${page.prePage });">上一页</a>
										</c:if>
									
										<c:forEach var="pn" items="${page.navigatepageNums }">
											&nbsp;&nbsp;<a class="pgbtn"
												<c:if test="${pn==page.pageNum }">style="background:#ddd"</c:if>
												href="javascript:formSubmit(${pn });">${pn }</a>&nbsp;&nbsp;
										</c:forEach>
									
										<c:if test="${page.hasNextPage }">
											<a class="jumpbtn" href="javascript:formSubmit(${page.nextPage });">下一页</a>
										</c:if>
									
										<c:if test="${page.pages==1 }">
											<h4>只有一页</h4>
										</c:if>
									
										<c:if test="${page.total==0 }">
											<h4>----没有数据----</h4>
										</c:if>
										
									</div>
									
									<div class="clear-block">
										<div class="meta"></div>
									</div>
								</div>
							</div>
							<div id="footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	
</body>
</html>