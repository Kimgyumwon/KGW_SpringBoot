<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach items="${list}" var="dto">
	<div class="comment-bubble">
		<div class="bubble-user">${dto.username}</div>
		<div class="bubble-box">
		  <span class="bubble-text">${dto.boardContents}</span>
		</div>
		<div class="bubble-date">${dto.boardDate}</div>
	</div>
</c:forEach>
