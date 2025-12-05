<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>

<table>
	<c:forEach items="${list}" var="v">
		<tr>
			<td>${v.username}</td>
			<td>${v.boardContents}</td>
			<td>${v.boardDate}</td>
		</tr>
	</c:forEach>
</table>


<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">

       		<!-- 이전 버튼 -->
          <li class="page-item">
              <button class="page-link" data-pager-num="${pager.begin - 1}" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
              </button>
          </li>

      <!-- 페이지 번호들 -->
      <c:forEach begin="${pager.begin}" end="${pager.end}" var="num">
          <li class="page-item ${pager.page == num ? 'active' : ''}">
              <button class="page-link" data-pager-num="${num}">${num}</button>
          </li>
      </c:forEach>

 <!-- 다음 버튼 -->
     <li class="page-item">
         <button class="page-link" data-pager-num="${pager.end + 1}" aria-label="Next">
               <span aria-hidden="true">&raquo;</span>
           </button>
     </li>
    </ul>
</nav>
