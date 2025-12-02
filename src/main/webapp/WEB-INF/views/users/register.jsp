<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

</style>
</head>

<body>
    <div class="container">
        <h2>회원가입</h2>

        <form method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="username" required placeholder="아이디를 입력하세요">
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required placeholder="비밀번호를 입력하세요">
            </div>

            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required placeholder="이름을 입력하세요">
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required placeholder="example@domain.com">
            </div>

            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" placeholder="010-0000-0000">
            </div>

            <div class="form-group">
                <label for="birth">생년월일</label>
                <input type="date" id="birth" name="birth">
            </div>
			
			<div class="form-group">
			    <label for="profile">프로필 사진</label>
			    <input type="file" id="profile" name="attach" accept="image/*">
			</div>
			
			
            <button type="submit" class="btn-submit">회원가입</button>

            <div class="login-link">
                이미 계정이 있나요? <a href="/user/login">로그인</a>
            </div>

        </form>
    </div>
</body>
</html>
