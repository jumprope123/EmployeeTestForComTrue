<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="main">
    <form id="inputForm" class="margin1050">
        <div class="row mt-5">
            <div class="col-1 offset-3 text-center">
                <label for="inputPosition">직책</label>
            </div>
            <div class="col-4 text-center">
                <select id="inputPosition" class="form-control" name="position">
                    <option value="staff" selected>사원</option>
                    <option value="astManager">대리</option>
                    <option value="manager">과장</option>
                    <option value="snManager">차장</option>
                    <option value="HManager">부장</option>
                    <option value="President">사장</option>
                </select>
            </div>
            <div class="col-4 text-danger">직책을 선택해주세요</div>
        </div>
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputName">이름</label>
            </div>
            <div class="col-4 text-center">
                <input type="text" id="inputName" class="form-control" name="name">
            </div>
            <div class="col-4 text-danger">이름은 한글 또는 영어로 작성하세요</div>
        </div>
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputPhone1">전화번호</label>
            </div>
            <div class="input-group col-4">
                <input type="text" id="inputPhone1" class="form-control" name="phone1" value="010" readonly>
                <span class="input-group-text">-</span>
                <input type="text" id="inputPhone2" class="form-control" name="phone2">
                <span class="input-group-text">-</span>
                <input type="text" id="inputPhone3" class="form-control" name="phone3">
            </div>
            <div class="col-4 text-danger">전화번호는 010으로 시작해야합니다.</div>
        </div>
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputEmail1">이메일</label>
            </div>
            <div class="input-group col-5">
                <input type="text" id="inputEmail1" class="form-control" name="email1">
                <span class="input-group-text">@</span>
                <input type="text" id="inputEmail2" class="form-control" name="email2" value="naver.com" readonly>
                <select class="form-control" id="emailAdd">
                    <option>naver.com</option>
                    <option>daum.net</option>
                    <option>gmail.com</option>
                    <option>직접입력</option>
                </select>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-12 text-center">
                <button id="inputOkBtn" class="btn btn-success">입력완료</button>
                <button id="inputCancelBtn" class="btn btn-danger">입력취소</button>
            </div>
        </div>
    </form>
</div>
