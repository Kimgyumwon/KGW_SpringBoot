<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>에러 발생</title>

<style>
    body {
        margin: 0;
        background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
        font-family: "Noto Sans KR", sans-serif;
    }

    .error-container {
        width: 480px;
        margin: 120px auto;
        background: #fff;
        border-radius: 16px;
        padding: 40px 30px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        text-align: center;
    }

    .error-icon {
        font-size: 60px;
        margin-bottom: 15px;
    }

    .error-title {
        font-size: 22px;
        font-weight: 700;
        color: #333;
        margin-bottom: 10px;
    }

    .error-message {
        font-size: 15px;
        color: #666;
        margin-bottom: 25px;
        line-height: 1.5;
    }

    .error-code {
        display: inline-block;
        background: #f1f3f5;
        padding: 6px 14px;
        border-radius: 20px;
        font-size: 13px;
        color: #555;
        margin-bottom: 25px;
    }

    .btn-group {
        display: flex;
        justify-content: center;
        gap: 12px;
    }

    .btn {
        padding: 10px 18px;
        border-radius: 10px;
        border: none;
        font-size: 14px;
        cursor: pointer;
        transition: 0.2s;
    }

    .btn-home {
        background: #4a7ab7;
        color: #fff;
    }

    .btn-home:hover {
        background: #3b679b;
    }

    .btn-back {
        background: #e9ecef;
        color: #333;
    }

    .btn-back:hover {
        background: #dee2e6;
    }

    .detail {
        margin-top: 25px;
        text-align: left;
        font-size: 12px;
        color: #777;
        background: #fafafa;
        padding: 15px;
        border-radius: 10px;
        max-height: 160px;
        overflow: auto;
    }
</style>
</head>

<body>

<div class="error-container">
    <div class="error-icon">⚠️</div>

    <div class="error-title">
        요청을 처리하는 중 문제가 발생했습니다
    </div>

    <div class="error-message">
        잠시 후 다시 시도해 주세요.<br>
        문제가 계속되면 관리자에게 문의 바랍니다.
    </div>

    <div class="error-code">
        ERROR : ${requestScope['jakarta.servlet.error.status_code']}
    </div>

    <div class="btn-group">
        <button class="btn btn-home" onclick="location.href='/'">
            홈으로
        </button>
        <button class="btn btn-back" onclick="history.back()">
            이전 페이지
        </button>
    </div>
</div>

</body>
</html>
