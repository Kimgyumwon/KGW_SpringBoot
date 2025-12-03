<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 시스템</title>
<c:import url="/WEB-INF/views/template/head.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">

<style>

/* 기존 notice-form 유지 */
.notice-form {
  max-width: 600px;
  margin: 0 auto;
  padding: 3rem 2rem;
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
}

.notice-form h2 {
  margin-bottom: 1.5rem;
  text-align: center;
  color: #333;
}

.notice-form label {
  margin-top: 1rem;
  font-weight: 600;
  color: #444;
}

.notice-form input,
.notice-form textarea {
  margin-top: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 0.75rem;
  width: 100%;
  font-size: 1rem;
}

.notice-form textarea {
  resize: vertical;
}

.notice-form button[type="submit"] {
  margin-top: 1.5rem;
  width: 100%;
  padding: 0.75rem;
  font-size: 1.1rem;
  background-color: #3366ff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.notice-form button[type="submit"]:hover {
  background-color: #254eda;
}

/* ==============================
   추가한 “파일 업로드 UI 개선 CSS”
================================ */
#fileAddBtn {
    background: #4a7cff;
    border: none;
    color: white;
    padding: 8px 16px;
    border-radius: 6px;
    cursor: pointer;
    margin-bottom: 10px;
}

#fileAddBtn:hover {
    background: #3d6ae8;
}

/* 파일 추가되는 박스 정렬 */
#files > div {
    display: flex;
    align-items: center;
    gap: 10px;

    margin-bottom: 10px;
    padding: 10px 12px;

    border: 1px solid #ddd;
    border-radius: 8px;
    background: #f9f9f9;
}

/* input file 자연스럽게 */
#files input[type="file"] {
    flex: 1;
    padding: 4px;
}

/* X 삭제 버튼 */
.del {
    background: #ff4d4d;
    border: none;
    color: white;
    font-weight: bold;
    padding: 6px 12px;
    border-radius: 6px;
    cursor: pointer;
}

.del:hover {
    background: #d90000;
}

/* 깨졌던 form-control btn 제거 */
#files.form-control.btn {
    width: 100%;
    padding: 0;
    border: none;
    background: transparent;
}

</style>
</head>

<body id="page-top">

<div id="wrapper">

  <!-- sidebar -->
  <c:import url="/WEB-INF/views/template/sidebar.jsp"/>

  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">

      <!-- topbar -->
      <c:import url="/WEB-INF/views/template/topbar.jsp"/>

      <div class="container-fluid">

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">${category} ${kind}</h1>
          <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
          </a>
        </div>

        <div class="row">

          <!-- ❗ 로직 그대로 유지한 form -->
          <form method="post" class="notice-form" enctype="multipart/form-data">
            <input type="hidden" name="boardNum" value="${board.boardNum}">

            <label for="board_title">제목</label>
            <input type="text" id="board_title" name="boardTitle"
                   placeholder="제목을 입력하세요" value="${board.boardTitle}" required />

            <label for="board_writer">작성자</label>
            <input type="text" id="board_writer" name="boardWriter"
                   placeholder="작성자 이름" value="${board.boardWriter}" required />

            <label for="board_contents">내용</label>
            <textarea id="board_contents" name="boardContents" rows="8"
                      placeholder="공지 내용을 입력하세요" required>${board.boardContents}</textarea>

            <div>
              <button type="button" id="fileAddBtn">File Add</button>
            </div>

            <!-- 파일 박스 (UI만 개선) -->
            <div id="files"></div>

            <button type="submit">${kind}</button>
          </form>

        </div>

      </div>
    </div>

    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; Your Website 2021</span>
        </div>
      </div>
    </footer>

  </div>
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
<script>
  $("#board_contents").summernote();
</script>

<script src="/js/board/board.js"></script>

</body>
</html>
