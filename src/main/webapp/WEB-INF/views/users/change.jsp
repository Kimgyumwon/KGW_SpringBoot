<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

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
</style>

</head>
<body>

<div class="container">

    <h2>비밀번호 변경</h2>

    <form:form modelAttribute="usersDTO" action="./change" method="post">

        <!-- 현재 비밀번호 -->
        <div class="form-group">
            <label for="exist">현재 비밀번호</label>
            <input type="password" name="exist">
        </div>

        <!-- 새 비밀번호 -->
        <div class="form-group">
            <label for="password">새 비밀번호</label>
            <form:password path="password" id="password"/>
            <form:errors path="password"/>
        </div>

        <!-- 새 비밀번호 확인 -->
        <div class="form-group">
            <label for="passowrdCheck">새 비밀번호 확인</label>
            <form:password path="passwordCheck" id="passwordCheck"/>
            <form:errors path="passwordCheck"/>
        </div>

        <button class="btn-save" type="submit">비밀번호 변경</button>
    </form:form>

</div>

</body>
</html>
