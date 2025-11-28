<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 시스템</title>
<c:import url="/WEB-INF/views/template/head.jsp"/>
</head>
<body id="page-top">

	<div id="wrapper">
		<!-- side bar -->
		<c:import url="/WEB-INF/views/template/sidebar.jsp"/>
		<!-- side bar -->
		
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
       			
       			<!-- topbar -->
       			<c:import url="/WEB-INF/views/template/topbar.jsp"/>
            	<!-- topbar -->
            	
			<div class="container-fluid">
			    <!-- Page Heading -->
			    <div class="d-sm-flex align-items-center justify-content-between mb-4">
			        <h1 class="h3 mb-0 text-gray-800">QnA</h1>
			        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			            <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
			        </a>
			    </div>
			
			    <!-- ⭐ 검색창 영역 -->
			    <div class="row justify-content-center">
			        <div class="col-12 col-md-8">
			            <form>
			                <div class="input-group mb-3">
			                    <select class="form-control" name="kind">
			                        <option value="k1">Title</option>
			                        <option value="k2">Contents</option>
			                        <option value="k3">Writer</option>
			                    </select>
			
			                    <input type="text" class="form-control" name="search" placeholder="검색어 입력">
			
			                    <div class="input-group-append">
			                        <button class="btn btn-outline-secondary" type="submit">검색</button>
			                    </div>
			                </div>
			            </form>
			        </div>
			    </div>
			    <!-- ⭐ 검색창 끝 -->
			
			    <!-- Content Row -->
			    <div class="row justify-content-center">
			        <table class="table table-striped col-sm-8 mt-3">
			            <thead>
			            <tr>
			                <th>#</th>
			                <th>Title</th>
			                <th>Writer</th>
			                <th>Date</th>
			                <th>Hit</th>
			            </tr>
			            </thead>
			            <tbody>
			            <c:forEach items="${list}" var="qna">
			                <tr>
			                    <th scope="row">${qna.boardNum}</th>
			                    <td>${qna.boardTitle}</td>
			                    <td>${qna.boardWriter}</td>
			                    <td>${qna.boardDate}</td>
			                    <td>${qna.boardHit}</td>
			                </tr>
			            </c:forEach>
			            </tbody>
			        </table>
			    </div>
			
			    <div class="row justify-content-center">
			        <nav aria-label="Page navigation example">
			            <ul class="pagination">
			                <li class="page-item">
			                    <a class="page-link" href="./list?page=${pager.begin-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			                        &laquo;
			                    </a>
			                </li>
			
			                <c:forEach begin="${pager.begin}" end="${pager.end}" var="i">
			                    <li class="page-item">
			                        <a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
			                    </li>
			                </c:forEach>
			
			                <li class="page-item">
			                    <a class="page-link" href="./list?page=${pager.end + 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
			                        &raquo;
			                    </a>
			                </li>
			            </ul>
			        </nav>
                <!-- 글쓰기 버튼 -->
		        <div class="col-auto">
		            <a href="add" class="btn btn-outline-danger">글쓰기</a>
		        </div>
			    </div>
			</div>

                
            </div> 
            <!-- End of Main Content -->
            
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
	
	</div>
	

	<c:import url="/WEB-INF/views/template/foot.jsp"/>
	
	
	
	
	
	
</body>
</html>
