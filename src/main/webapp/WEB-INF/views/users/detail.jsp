<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
    body {
        margin: 0;
        background: #f4f6fb;
        font-family: "Noto Sans KR", sans-serif;
    }

    .container {
        width: 450px;
        margin: 60px auto;
        padding: 30px;
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 4px 14px rgba(0,0,0,0.08);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
        font-size: 24px;
    }

    .profile-img {
        width: 110px;
        height: 110px;
        border-radius: 50%;
        background: #e6e9f2;
        margin: 0 auto 15px auto;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        color: #555;
        overflow: hidden;
    }

    .profile-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        color: #555;
        font-size: 14px;
    }

    .form-group input {
        width: 100%;
        padding: 12px;
        border-radius: 10px;
        border: 1px solid #ccc;
        font-size: 15px;
        box-sizing: border-box;
        transition: all 0.2s ease;
    }

    .form-group input:focus {
        border-color: #4a7cff;
        outline: none;
        box-shadow: 0 0 0 3px rgba(74,124,255,0.2);
    }

    .btn-save {
        width: 100%;
        padding: 12px;
        border: none;
        background: #4a7cff;
        color: #fff;
        font-size: 16px;
        border-radius: 10px;
        cursor: pointer;
        transition: 0.2s;
        margin-top: 10px;
    }

    .btn-save:hover {
        background: #3a64e3;
    }

    .readonly {
        background: #f1f1f1;
        cursor: not-allowed;
    }
	
	
.btn-password {
    display: block;           /* a태그도 버튼처럼 전체 너비 */
    text-align: center;
    background: #ff6b6b;      /* 빨간색 */
    margin-top: 8px;          /* 위 버튼과 간격 살짝 */
    text-decoration: none;    /* 링크 밑줄 제거 */
}

.btn-password:hover {
    background: #e65454;
}
	
	
</style>

</head>
<body>

<div class="container">

    <h2>마이페이지</h2>

    <!-- 프로필 이미지 -->
    <div class="profile-img">
        <c:choose>
            <c:when test="${user.usersFileDTO.fileName != null}">
                <img src="/files/users/${user.usersFileDTO.fileName}" alt="profile">
            </c:when>
            <c:otherwise>
                기본 이미지
            </c:otherwise>
        </c:choose>
    </div>
	
	<form:form modelAttribute="user" action="./update" method="post">
		
	    <!-- 아이디 - readonly -->
	    <div class="form-group">
	        <label for="username">아이디</label>
	        <form:input path="username" id="username" cssClass="readonly" readonly="true"/>
	        <form:errors path="username"/>
	    </div>
	

	
	    <!-- 이름 -->
	    <div class="form-group">
	        <label for="name">이름</label>
	        <form:input path="name" id="name"/>
	        <form:errors path="name"/>
	    </div>
	
	    <!-- 이메일 -->
	    <div class="form-group">
	        <label for="email">이메일</label>
	        <form:input path="email" id="email" type="email"/>
	        <form:errors path="email"/>
	    </div>
	
	    <!-- 전화번호 -->
	    <div class="form-group">
	        <label for="phone">전화번호</label>
	        <form:input path="phone" id="phone"/>
	        <form:errors path="phone"/>
	    </div>
	
	    <!-- 생년월일 -->
	    <div class="form-group">
	        <label for="birth">생년월일</label>
	        <form:input path="birth" id="birth" type="date"/>
	        <form:errors path="birth"/>
	    </div>
	
	    <button class="btn-save" type="submit">정보 수정</button>
		<a href="./change" class="btn-save btn-password">비밀번호 변경</a>
		<a href="./delete" class="btn btn-info">회원탈퇴</a>
	</form:form>

</div>

</body>
</html>
