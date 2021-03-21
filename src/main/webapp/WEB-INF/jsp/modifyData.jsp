<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="main">
    <input type="hidden" id="modiEno" value="${Data.eno}">
    <input type="hidden" id="modiPosition" value="${Data.position}">
    <input type="hidden" id="modiName" value="${Data.name}">
    <input type="hidden" id="modiPhone1" value="${Data.phone1}">
    <input type="hidden" id="modiPhone2" value="${Data.phone2}">
    <input type="hidden" id="modiPhone3" value="${Data.phone3}">
    <input type="hidden" id="modiEmail1" value="${Data.email1}">
    <input type="hidden" id="modiEmail2" value="${Data.email2}">
    <form id="inputFormMod" class="margin1050">
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputEnoMod">직원번호</label>
            </div>
            <div class="col-4 text-center">
                <input type="number" id="inputEnoMod" class="form-control" name="eno">
            </div>
            <div class="col-4 text-danger">1000이하의 양수만 입력가능합니다.</div>
        </div>
        <div class="row mt-5">
            <div class="col-1 offset-3 text-center">
                <label for="inputPositionMod">직책</label>
            </div>
            <div class="col-4 text-center">
                <select id="inputPositionMod" class="form-control" name="position">
                    <option id="1" value="staff">사원</option>
                    <option id="2" value="astManager">대리</option>
                    <option id="3" value="manager">과장</option>
                    <option id="4" value="snManager">차장</option>
                    <option id="5" value="HManager">부장</option>
                    <option id="6" value="President">사장</option>
                </select>
            </div>
            <div class="col-4 text-danger">직책을 선택해주세요</div>
        </div>
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputNameMod">이름</label>
            </div>
            <div class="col-4 text-center">
                <input type="text" id="inputNameMod" class="form-control" name="name">
            </div>
            <div class="col-4 text-danger">이름은 한글 또는 영어로 작성하세요</div>
        </div>
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputPhone1Mod">전화번호</label>
            </div>
            <div class="input-group col-4">
                <input type="text" id="inputPhone1Mod" class="form-control" name="phone1" value="010" readonly>
                <span class="input-group-text">-</span>
                <input type="text" id="inputPhone2Mod" class="form-control" name="phone2">
                <span class="input-group-text">-</span>
                <input type="text" id="inputPhone3Mod" class="form-control" name="phone3">
            </div>
            <div class="col-4 text-danger">전화번호는 010으로 시작해야합니다.</div>
        </div>
        <div class="row mt-3">
            <div class="col-1 offset-3 text-center">
                <label for="inputEmail1Mod">이메일</label>
            </div>
            <div class="input-group col-5">
                <input type="text" id="inputEmail1Mod" class="form-control" name="email1">
                <span class="input-group-text">@</span>
                <input type="text" id="inputEmail2Mod" class="form-control" name="email2" value="naver.com" readonly>
                <select class="form-control" id="emailAddMod">
                    <option>naver.com</option>
                    <option>daum.net</option>
                    <option>gmail.com</option>
                    <option>직접입력</option>
                </select>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-12 text-center">
                <button id="inputOkBtnMod" class="btn btn-success">입력완료</button>
                <button id="inputCancelBtnMod" class="btn btn-danger">입력취소</button>
            </div>
        </div>
    </form>
</div>

