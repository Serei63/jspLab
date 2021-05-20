<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>AdminLTE 2 | 동아일보 게시판</title>

<%@ include file="../include/header.jspf" %>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<style type="text/css">
#news_list img {
	width: auto; height: auto;
    max-width: 50px;
    max-height: 50px;
}
</style>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					동아일보 게시판 <small>it all starts here</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">동아일보 게시판</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Title</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<div class="news_wrap">
							<table id="example" class="display" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>번호</th>
										<th>썸네일</th>
										<th>제목</th>
										<th>작성자</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tfoot>
									<hr>
								</tfoot>
								<tbody id="news_list">
								</tbody>
							</table>

						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">Footer</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" language="javascript" src="<%= request.getContextPath() %>/resources/pages/examples/js/DataTables/jquery.dataTables.min.js"></script>

	<script type="text/javascript" class="init">
		$(document).ready(function() {

			

		}); // end of $(document).ready(function()

		$(function() {
			//변수 g에 크로스 도메인의 데이터를 가져올 수 있도록 구글 주소를 저장하였습니다.
			//var g="https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&num=10&callback=?&q=";
			var g = "https://api.rss2json.com/v1/api.json?rss_url=";
			var dongaNews = "https://it.donga.com/feeds/rss/news/";
			var keys = "&api_key=icgocci5wsasojbgcrddgfoebgwufvjq6frfeeps";
			var counts = "&count=200";

				$.ajax({
						url : g + dongaNews + keys +counts, //요청할 데이터 경로.
						dataType : "json", //요청할 데이터에 타입.
						success : function(data) { //성공적으로 요청했왔을 때...
							//obj = JSONtoString(data);
							var obj = JSON.stringify(data);
							//alert(obj);

							//$.each(data.responseData.feed.entries,function(i, d){
								var num = 1;
									$.each(data.items,
											function(i, d) {
												//var date=new Date(d["publishedDate"]); //뉴스 작성 날짜 객체 생성
												var date = new Date(
														d["pubDate"]); //뉴스 작성 날짜 객체 생성
												//작성한 년-월-일 형식으로 변수 m에 저장합니다.
												var m = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
												var category = d["categories"];
												//var thumnail = d["description"];
												var img = $(d["description"]).find('img').attr('src');
												var title = d["title"]; //title 키의 값을 가져옵니다.
												var author = d["author"];
												var lk = d["link"];
												//앞서 구해온 데이터를 이용해 정보 목록 태그를 생성합니다.
												$("#news_list").append('<tr><td>'+num+'</td><td><img src="'+img
																+'"/>'+'</td><td><a href="'+lk+'" target="_blank">'
																+title+ '</a></td><td>'+ author+'</td><td>'+m+'</td></tr>');
												num++;
											}); // “$.each” 메서드에 종료
						}, // “success: function”에 종료
						
						error : function(data) {
							alert("에러 발생하였습니다.");	
						},
						
						complete : function(data) {
							$('#example').DataTable({
								"language" : {
									"sEmptyTable" : "데이터가 없습니다",
									"sInfo" : "_START_ - _END_ / _TOTAL_",
									"sInfoEmpty" : "0 - 0 / 0",
									"sInfoFiltered" : "(총 _MAX_ 개)",
									"sInfoPostFix" : "",
									"sInfoThousands" : ",",
									"sLengthMenu" : "페이지당 줄수 _MENU_",
									"sLoadingRecords" : "읽는중...",
									"sProcessing" : "처리중...",
									"sSearch" : "검색:",
									"sZeroRecords" : "검색 결과가 없습니다",
									"oPaginate" : {
										"sFirst" : "처음",
										"sLast" : "마지막",
										"sNext" : "다음",
										"sPrevious" : "이전"
									},
									"oAria" : {
										"sSortAscending" : ": 오름차순 정렬",
										"sSortDescending" : ": 내림차순 정렬"
									}
								}
							}); // end of $('#example').DataTable
						}
						
					}); // $.ajax() 메서드에 종료

		});
	</script>

<%@ include file="../include/footer.jspf" %>
