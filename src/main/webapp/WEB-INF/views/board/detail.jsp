<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 시스템</title>
<c:import url="/WEB-INF/views/template/head.jsp"/>

<style>

    .detail-container {
        width: 700px;
        margin: auto;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }

    .detail-header {
        border-bottom: 1px solid #ddd;
        margin-bottom: 20px;
    }

    .detail-row {
        margin-bottom: 12px;
    }

    .label {
        font-weight: bold;
        margin-right: 10px;
        color: #444;
    }

    .content-box {
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 5px;
        background: #fafafa;
        min-height: 200px;
        white-space: pre-line; /* 줄바꿈 유지 */
    }

    .btn-box {
        margin-top: 25px;
        text-align: right;
    }

    .btn {
        display: inline-block;
        padding: 8px 18px;
        border-radius: 5px;
        background: #4a7cff;
        color: white;
        font-weight: 600;
        text-decoration: none;
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
                        <h1 class="h3 mb-0 text-gray-800">${category} Detail</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">
                    
                   		<div class="detail-container">
						    <div class="detail-header">
						        <h2>${notice.boardTitle}</h2>
						    </div>
						
						    <div class="detail-row">
						        <span class="label">글번호:</span> ${board.boardNum}
						    </div>
						
						    <div class="detail-row">
						        <span class="label">작성자:</span> ${board.boardWriter}
						    </div>
						
						    <div class="detail-row">
						        <span class="label">작성일:</span> ${board.boardDate}
						    </div>
						
						    <div class="detail-row">
						        <span class="label">조회수:</span> ${board.boardHit}
						    </div>
						
						    <div class="detail-row">
						        <span class="label">내용:</span>
						        <div class="content-box">
						            ${board.boardContents}
						        </div>
						        
						        <div>
						        	<c:forEach items="${board.boardFileList}" var="file">
						        		<div>
						        			<a href="./fileDown?fileNum=${file.fileNum}">${file.fileOrigin}</a>
						        		</div>
						        	</c:forEach>
						        </div>
						        
						        <c:if test="${category ne 'notice'}">
						        	<a href="./reply?boardNum=${board.boardNum}" class="btn btn-danger">답글달기</a>
						        </c:if>
						    </div>
						
						    <div class="btn-box">
						        <a href="./list" class="btn btn btn-outline-success">목록으로</a>
						        
						        <form action="./delete" method="post" id="frm">
						        	<input type="hidden" name="boardNum" value="${board.boardNum}">
						        </form>
						        <button class="btn btn-outline-danger" id="upBtn">수정</button>
						        <button class="btn btn-outline-dark" id="delBtn">삭제</button>
						    </div>
						</div>
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
	
	<script type="text/javascript">
		const delBtn = document.getElementById("delBtn");
		const frm = document.getElementById("frm");
		
		delBtn.addEventListener("click",function(){
			let check = confirm("진짜 삭제할거야?");
			
			if (check) {
				frm.submit();
			}
			
		});
		const upBtn = document.getElementById("upBtn");
		upBtn.addEventListener("click" , function () {
			frm.setAttribute("action", "./update");
			frm.method = "get";
			frm.submit();
			alert("정말 수정할거야?");
			
		});
	
	
	</script>
	
	
	
	
</body>
</html>
