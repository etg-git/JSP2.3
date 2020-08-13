<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
	<title>여기는 홈</title>
</head>
<body>
	
	<jsp:include page = "searchForm.jsp" />
	<hr/>
	<article class="container" style=margin-top:100px;>
          <div class="page-header">
              <div class="col-md-6 col-md-offset-3">
              <h3>회원가입 Form</h3>
              </div>
          </div>
          <div class="col-sm-6 col-md-offset-3">
              <form action = "MainServlet" method = "post">
              <input type = "hidden" name = "cmd" value = "insert"> 
                  <div class="form-group">
                      <label for="inputName">성명</label>
                      <input type="text" class="form-control" name = "name" placeholder="이름을 입력해 주세요">
                  </div>
                  <div class="form-group">
                      <label for="inputPassword">비밀번호</label>
                      <input type="password" class="form-control"  name = "password" placeholder="비밀번호를 입력해주세요">
                  </div>
                  <div class="form-group">
                      <label for="inputNickname">닉네임</label>
                      <input type="text" class="form-control" name = "nickName" placeholder="닉네임을 입력 해 주세요">
                  </div>
                  <div class="form-group">
                      <label for="inputMobile">휴대폰 번호</label>
                      <input type="text" class="form-control" name = "tel" placeholder="휴대폰번호를 입력해 주세요">
                  </div>
                  <div class="form-group text-center">
                      <button type="submit"  class="btn btn-primary">
                          회원가입<i class="fa fa-check spaceLeft"></i>
                      </button>
                  </div>
              </form>
          </div>
          </article>
</body>
</html>