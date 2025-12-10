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
	
	.message-box {
    padding: 12px 15px;
    background: #ffe5e5;
    color: #d9534f;
    border: 1px solid #f5c6cb;
    border-radius: 10px;
    margin-bottom: 20px;
    font-size: 14px;
    text-align: center;
}

.message-box.success {
    background: #e2f7e2;
    color: #3c763d;
    border: 1px solid #b2d8b2;
}

.remember-group {
    display: flex;
    align-items: center;
    margin-top: -5px;
    margin-bottom: 10px;
}

.remember-group input {
    width: 16px;
    height: 16px;
    margin-right: 6px;
}

.remember-group label {
    font-size: 14px;
    color: #555;
    cursor: pointer;
}

</style>
</head>

<body>
    <div class="container">
        <h2>로그인</h2>
		
	    <div class="message-box">
	        ${param.message}
	    </div>
		
        <form method="post">

            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="username" required placeholder="아이디를 입력하세요">
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" value="anananan" required placeholder="비밀번호를 입력하세요">
            </div>
			
			<div class="remember-group">
			    <input type="checkbox" id="rememberId" name="rememberme">
			    <label for="rememberId">Remember me</label>
			</div>
			
			
            <button type="submit" class="btn-submit">로그인</button>

            <div class="login-link">
                이미 계정이 있나요? <a href="/users/register">회원가입</a>
            </div>

        </form>
    </div>
</body>
</html>
