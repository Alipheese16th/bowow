<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<span class="flex-shrink-0 p-3 col-2" style="width: 280px;">
	    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
	      <span class="fs-5 fw-semibold">관리자 페이지</span>
	    </a>
	    <ul class="list-unstyled ps-0">
	      <li class="mb-1">
	        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
	        	상품관리▽
	        </button>
	        <div class="collapse" id="home-collapse">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="${conPath }/product.add.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">상품등록</a></li>
	            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">상품수정</a></li>
	            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">상품삭제</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="mb-1">
	        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
	        	공지사항 관리▽
	        </button>
	        <div class="collapse" id="dashboard-collapse" style="">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="${conPath }/notice/list.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항 등록</a></li>
	            <li><a href="${conPath }/notice/list.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항 수정</a></li>
	            <li><a href="${conPath }/notice/list.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항 삭제</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="mb-1">
	        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
	        	QnA관리▽
	        </button>
	        <div class="collapse" id="orders-collapse">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="${conPath }/qna/list.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">QnA 답변</a></li>
	            <li><a href="${conPath }/qna/list.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">QnA 삭제</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="mb-1">
	        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
	          1:1문의 관리▽
	        </button>
	        <div class="collapse" id="account-collapse" style="">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="${conPath }/inquiry/list.do" class="link-dark d-inline-flex text-decoration-none rounded">1:1문의 답변</a></li>
	            <li><a href="${conPath }/inquiry/list.do" class="link-dark d-inline-flex text-decoration-none rounded">1:1문의 삭제</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="mb-1">
	        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#faq-collapse" aria-expanded="false">
				FAQ관리▽
	        </button>
	        <div class="collapse" id="faq-collapse" style="">
	          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="${conPath }/faq/write.do" class="link-dark d-inline-flex text-decoration-none rounded">FAQ 등록</a></li>
	            <li><a href="${conPath }/faq/list.do" class="link-dark d-inline-flex text-decoration-none rounded">FAQ 수정</a></li>
	            <li><a href="${conPath }/faq/list.do" class="link-dark d-inline-flex text-decoration-none rounded">FAQ 삭제</a></li>
	          </ul>
	        </div>
	      </li>
	    </ul>
    </span>
</body>
</html>