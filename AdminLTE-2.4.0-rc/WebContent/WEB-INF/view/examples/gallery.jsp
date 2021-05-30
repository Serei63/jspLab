<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>AdminLTE 2 | Gallery</title>

<%@ include file="../include/header.jspf" %>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #000;
}

#gallery {
	width: 350px;
	margin: 30px auto;
	border: 1px solid #999;
	box-shadow: 0 5px 5px rgba(0, 0, 0, 0.3);
}

#gallery h1 {
	text-align: center;
}

#gallery img {
	border: 1px solid #666;
}

#photo {
	text-align: center;
}

#gallery ul {
	width: 800px;
	margin: 0 auto;
	overflow: hidden;
}

#photo_list ul li {
	width: 100px;
	float: left;
	text-align: center;
}

#photo_list {
	width: 300px;
	margin: 10px auto;
	/*border:1px dashed #000;*/
	overflow: hidden;
}

.btn_wrap {
	text-align: center;
}

.btn_wrap a {
	font-weight: bold;
}
</style>



		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					갤러리 <small>Gallery</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">갤러리</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">동해안 갤러리</h3>

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
						<div id="gallery">
							<h1></h1>
							<p id="photo">
								<img src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_1.jpg" width="320" alt="" />
							</p>
							<div id="photo_list">
								<ul id="inner_list">
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_1.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t1.jpg" alt="사진1" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_2.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t2.jpg" alt="사진2" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_3.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t3.jpg" alt="사진3" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_4.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t4.jpg" alt="사진4" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_5.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t5.jpg" alt="사진5" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_6.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t6.jpg" alt="사진6" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_7.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t7.jpg" alt="사진7" /></a></li>
									<li><a href="<%= request.getContextPath() %>/resources/pages/examples/images/pic_8.jpg"> <img
											src="<%= request.getContextPath() %>/resources/pages/examples/images/pic_t8.jpg" alt="사진8" /></a></li>
								</ul>
							</div>
							<p class="btn_wrap">
								<a href="#" id="before_btn">&lt;</a> <a href="#" id="next_btn">&gt;</a>
							</p>
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
		
		
		<script type="text/javascript">
	//<![CDATA[
	window.onload = function() {

		var list_zone = document.getElementById("inner_list");
		var list_a = list_zone.getElementsByTagName("a");

		for (var i = 0; i < list_a.length; i++) {
			list_a[i].onclick = function() {
				var ph = document.getElementById("photo").children[0];
				ph.src = this.href;
				return false; // <a>를 클릭했을 때 링크로 이동하는 것을 막는다.
			}
		}

		var n_btn = document.getElementById("next_btn");
		var m_num = 0;
		n_btn.onclick = function() {
			if (m_num >= list_a.length - 3)
				return false;
			m_num++;
			list_zone.style.marginLeft = -100 * m_num + "px";
			return false;
		}

		var b_btn = document.getElementById("before_btn");
		b_btn.onclick = function() {
			if (m_num <= 0)
				return false;
			m_num--;
			list_zone.style.marginLeft = -100 * m_num + "px";
			return false;
		}

	}
	//]]>
</script>

<%@ include file="../include/footer.jspf" %>
