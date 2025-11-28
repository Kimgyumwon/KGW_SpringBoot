<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 시스템</title>
<c:import url="/WEB-INF/views/template/head.jsp"/>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
<style type="text/css">

.notice-form {
  max-width: 600px;
  margin: 0 auto;
  padding: 3rem 2rem;
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
}

.notice-form h2 {
  margin-bottom: 1.5rem;
  text-align: center;
  color: #333;
}

.notice-form label {
  margin-top: 1rem;
  font-weight: 600;
  color: #444;
}

.notice-form input,
.notice-form textarea {
  margin-top: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 0.75rem;
  width: 100%;
  font-size: 1rem;
}

.notice-form textarea {
  resize: vertical;
}

.notice-form button[type="submit"] {
  margin-top: 1.5rem;
  width: 100%;
  padding: 0.75rem;
  font-size: 1.1rem;
  background-color: #3366ff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.notice-form button[type="submit"]:hover {
  background-color: #254eda;
}

</style>



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
            	
            	<!-- Begin Page Content -->
                <div class="container-fluid">
                	<!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">글쓰기</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">
                    
	                    <form method="post" class="notice-form">
						  <label for="board_title">제목</label>
						  <input type="text" id="board_title" name="boardTitle" placeholder="제목을 입력하세요" required />
						
						  <label for="board_writer">작성자</label>
						  <input type="text" id="board_writer" name="boardWriter" placeholder="작성자 이름" required />
						
						  <label for="board_contents">내용</label>
						  <textarea id="board_contents" name="boardContents" placeholder="공지 내용을 입력하세요" rows="8" required></textarea>
						
						
						  <button type="submit">등록하기</button>
						</form>

                    </div>
                
                </div>
                <!-- /.container-fluid -->
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
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>

<script type="text/javascript">
	$("#board_contents").summernote()
</script>
	
	
	
	
</body>
</html>
