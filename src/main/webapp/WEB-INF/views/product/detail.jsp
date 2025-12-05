<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Product</title>
<c:import url="/WEB-INF/views/template/head.jsp"/>
<style type="text/css">
.comment-wrapper {
  margin-top: 20px;
}

.comment-bubble {
  margin-bottom: 18px;
  padding-left: 10px;
}

.bubble-user {
  font-size: 0.8rem;
  color: #4a7ab7;
  margin-bottom: 3px;
  padding-left: 8px;
}

.bubble-box {
  display: inline-block;
  background: #e2f3d5;
  padding: 10px 14px;
  border-radius: 16px;
  max-width: 75%;
  position: relative;
  font-size: 0.95rem;
  color: #333;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.bubble-box::before {
  content: "";
  position: absolute;
  left: -8px;
  top: 10px;
  border: 8px solid transparent;
  border-right-color: #e2f3d5;
}

.bubble-text {
  line-height: 1.4;
}

.bubble-date {
  font-size: 0.75rem;
  color: #888;
  margin-top: 4px;
  padding-left: 8px;
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
                        <h1 class="h3 mb-0 text-gray-800">Product Detail</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">
                    
                    <!-- 생성한 contents 작성 -->
					<div class="col-12">
					    <div class="card shadow p-4">
					
					        <!-- 상품 카테고리 -->
					        <div class="text-primary font-weight-bold text-uppercase mb-2" style="font-size: 0.9rem;">
					            ${dto.productCategory}
					        </div>
					
					        <!-- 상품명 -->
					        <h2 class="font-weight-bold text-gray-800 mb-3">
					            ${dto.productName}
					        </h2>
					
					        <!-- 금리 -->
					        <div class="mb-3" style="font-size: 1.2rem; font-weight: 600; color:#4e73df;">
					            연 ${dto.productRate}%
					        </div>
					
					        <!-- 판매 상태 -->
					        <c:choose>
					            <c:when test="${dto.productSale == false}">
					                <span class="badge badge-success mb-4" style="font-size:1rem;">판매중</span>
					            </c:when>
					            <c:otherwise>
					                <span class="badge badge-secondary mb-4" style="font-size:1rem;">판매중지</span>
					            </c:otherwise>
					        </c:choose>
					
					        <hr>
					
					        <!-- 상세 설명 -->
					        <h6 class="font-weight-bold text-gray-700 mb-2">상품 설명</h6>
					        <p class="text-gray-900" style="line-height: 1.7;">
					            ${dto.productContents}
					        </p>
					
					        <hr>
							
							<div id="list" class="comment-wrapper" data-product-num="${dto.productNum}">
							
							</div>
							<button class="btn btn-primary mb-3" id="openCommentModal" data-toggle="modal" data-target="#commentModal">
							    댓글 달기
							</button>
							
					        <!-- 버튼 영역 -->
					        <div class="d-flex justify-content-between mt-3">
					
					            <a href="./list" class="btn btn-secondary">
					                ← 목록으로
					            </a>
					
					            <div>
					            	
					            	
					                <a href="./update?productNum=${dto.productNum}" 
					                   class="btn btn-warning text-dark mr-2">
					                    수정하기
					                </a>
									<form action="./delete" method="post" class="d-inline"
									      onsubmit="return confirm('정말 삭제하시겠습니까?');">
									
									    <input type="hidden" name="productNum" value="${dto.productNum}">
									
									    <button type="submit" class="btn btn-danger">
									        삭제
									    </button>
									</form>
					            </div>
					
					        </div>
					
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
	

	<!-- 댓글 작성 모달 -->
<div class="modal fade" id="commentModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      
	<div class="modal-header">
	    <h5 class="modal-title">댓글 작성</h5>
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span>
	    </button>
	</div>

      <div class="modal-body">
        <textarea id="commentText" class="form-control" rows="4" placeholder="댓글을 입력하세요"></textarea>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-success" id="saveCommentBtn">등록하기</button>
      </div>

    </div>
  </div>
</div>

	<c:import url="/WEB-INF/views/template/foot.jsp"/>
	<script type="text/javascript" src="/js/product/product_comment.js"></script>	
	
	
	
	
</body>
</html>
