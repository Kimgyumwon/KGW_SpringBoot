<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

    <form action="/user/update" method="post">

        <!-- 아이디 - readonly -->
        <div class="form-group">
            <label for="username">아이디</label>
            <input type="text" id="username" name="username"
                   value="${user.username}" class="readonly" readonly>
        </div>

        <!-- 비밀번호 변경 -->
        <div class="form-group">
            <label for="password">새 비밀번호 (변경시에만 입력)</label>
            <input type="password" id="password" name="password"
                   placeholder="새 비밀번호 입력">
        </div>

        <!-- 이름 -->
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name"
                   value="${user.name}" required>
        </div>

        <!-- 이메일 -->
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email"
                   value="${user.email}" required>
        </div>

        <!-- 전화번호 -->
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone"
                   value="${user.phone}">
        </div>

        <!-- 생년월일 -->
        <div class="form-group">
            <label for="birth">생년월일</label>
            <input type="date" id="birth" name="birth"
                   value="${user.birth}">
        </div>

        <button class="btn-save" type="submit">정보 수정</button>
    </form>

</div>

</body>
</html>
