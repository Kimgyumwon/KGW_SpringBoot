<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
    body {
        margin: 0;
        background: #f4f6fb;
        font-family: "Noto Sans KR", sans-serif;
    }

    .container {
        width: 400px;
        margin: 80px auto;
        padding: 30px;
        background: #ffffff;
        border-radius: 14px;
        box-shadow: 0 4px 14px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
        font-size: 24px;
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

    .btn-submit {
        width: 100%;
        padding: 12px;
        border: none;
        background: #4a7cff;
        color: #fff;
        font-size: 16px;
        border-radius: 10px;
        cursor: pointer;
        transition: background 0.2s ease;
        margin-top: 10px;
    }

    .btn-submit:hover {
        background: #3d6ae8;
    }

    .login-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
    }

    .login-link a {
        color: #4a7cff;
        text-decoration: none;
        font-weight: bold;
    }
	
	.help-text {
    font-size: 0.85rem;
    color: #666;
    margin-top: 4px;
    display: block;
}
	
</style>
</head>

<body>
    <div class="container">
        <h2>회원가입</h2>
		
		<form:form modelAttribute="dto" method="post" enctype="multipart/form-data">
		    <div class="form-group">
		        <label for="username">아이디</label>
		        <form:input path="username" id="username"/>
		        <small class="help-text">영문 소문자 또는 숫자 5~10자로 입력하세요.</small>
		        <form:errors path="username"></form:errors>
		    </div>
		
		    <div class="form-group">
		        <label for="password">비밀번호</label>
		        <form:password path="password" id="password"/>
		        <small class="help-text">
		            비밀번호는 8자 이상이며 대문자·소문자·숫자·특수문자 중 3가지 이상을 포함해야 합니다.
		        </small>
		        <form:errors path="password"></form:errors>
		    </div>
		    <div class="form-group">
		        <label for="passwordCheck">비밀번호 확인</label>
		        <form:password path="passwordCheck" id="passwordCheck"/>
		        <small class="help-text">
		            비밀번호 확인
		        </small>
		        <form:errors path="passwordCheck"></form:errors>
		    </div>
		
		    <div class="form-group">
		        <label for="name">이름</label>
		        <form:input path="name" id="name"/>
		        <small class="help-text">한글 또는 영문으로 2~20자 이내로 입력하세요.</small>
		        <form:errors path="name"></form:errors>
		    </div>
		
		    <div class="form-group">
		        <label for="email">이메일</label>
		        <form:input path="email" id="email" type="email"/>
		        <small class="help-text">예: example@email.com 형식으로 입력하세요.</small>
		        <form:errors path="email"></form:errors>
		    </div>
		
		    <div class="form-group">
		        <label for="phone">전화번호</label>
		        <form:input path="phone" id="phone"/>
		        <small class="help-text">숫자만 입력하세요. 예: 01012345678</small>
		        <form:errors path="phone"></form:errors>
		    </div>
		
		    <div class="form-group">
		        <label for="birth">생년월일</label>
		        <form:input path="birth" id="birth" type="date"/>
		        <small class="help-text">올바른 날짜를 선택하세요.</small>
		        <form:errors path="birth"></form:errors>
		    </div>
		
		    <div class="form-group">
		        <label for="profile">프로필 사진</label>
		        <input type="file" id="profile" name="attach">
		        <small class="help-text">JPG, PNG 파일만 업로드 가능합니다. (최대 5MB)</small>
		    </div>
		
		    <button type="submit" class="btn-submit">회원가입</button>
		
		    <div class="login-link">
		        이미 계정이 있나요? <a href="/users/login">로그인</a>
		    </div>
		</form:form>

    </div>
</body>
</html>
