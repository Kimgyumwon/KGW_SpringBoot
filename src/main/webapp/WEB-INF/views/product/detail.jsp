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

    /* ==== 댓글 모달 디자인 업그레이드 ==== */
    #commentModal .modal-content {
        border-radius: 14px;
        border: none;
        box-shadow: 0 8px 30px rgba(0,0,0,0.15);
    }

    #commentModal .modal-header {
        background: #f5f7fb;
        border-bottom: none;
        border-radius: 14px 14px 0 0;
        padding: 20px 24px;
    }

    #commentModal .modal-title {
        font-size: 1.25rem;
        font-weight: 600;
        color: #333;
    }

    #commentModal .modal-body {
        padding: 20px 24px;
        background: #ffffff;
    }

    #commentModal textarea {
        width: 100%;
        border-radius: 10px;
        border: 1px solid #ced4da;
        padding: 14px;
        resize: none;
        font-size: 0.95rem;
        transition: all 0.2s;
    }

    #commentModal textarea:focus {
        border-color: #5a8dee;
        box-shadow: 0 0 0 3px rgba(90, 141, 238, 0.2);
    }

    #commentModal .modal-footer {
        padding: 16px 24px;
        border-top: none;
        background: #f9fafc;
        border-radius: 0 0 14px 14px;
    }

    #commentModal .btn-primary {
        background: #5a8dee;
        border: none;
        padding: 8px 18px;
        border-radius: 6px;
        font-weight: 500;
    }

    #commentModal .btn-primary:hover {
        background: #467de3;
    }

    #commentModal .btn-secondary {
        border-radius: 6px;
        padding: 8px 18px;
    }

    .modal-subtitle {
        font-size: 0.85rem;
        color: #666;
        margin-top: 4px;
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
							
							<div id="list" data-product-num="${dto.productNum}">
							
							</div>

					        <!-- 버튼 영역 -->
					        <div class="d-flex justify-content-between mt-3">
					
					            <a href="./list" class="btn btn-secondary">
					                ← 목록으로
					            </a>
					
					            <div>
		            		        <button type="button" id="cartAdd" class="btn btn-danger mr-2">장바구니</button>
					            	<button class="btn btn-primary mr-2 " data-toggle="modal" data-target="#commentModal">댓글달기</button>
					            
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
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		
		      <!-- Header -->
		      <div class="modal-header">
		        <h5 class="modal-title">댓글 작성</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		
		      <!-- Body -->
		      <div class="modal-body">
		      	<form method="post">
		      		<input type="hidden" value="${dto.productNum}">
		          <textarea id="contents" rows="5" class="form-control" 
		                    placeholder="댓글을 입력하세요"></textarea>
		      	
		      	</form>
		      </div>
		
		      <!-- Footer -->
		      <div class="modal-footer">
		        <!-- ★ close 버튼은 JS에서 close.click() 으로 호출함 -->
		        <button type="button" id="close" class="btn btn-secondary" data-dismiss="modal">취소</button>
		
		        <!-- ★ fetch 호출하는 버튼 -->
		        <button type="button" id="commentAdd" class="btn btn-primary">댓글 등록</button>
		      </div>
		
		    </div>
		  </div>
		</div>

	
	
	<c:import url="/WEB-INF/views/template/foot.jsp"/>
	<script type="text/javascript" src="/js/product/product_comment.js"></script>	
	
	
	
	
</body>
</html>
