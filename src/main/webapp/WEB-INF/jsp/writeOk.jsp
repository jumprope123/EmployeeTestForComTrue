<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="main">
    <div class="margin1050">
        <div class="row mt-5">
            <div class="col-12 text-center">사원정보의 입력이 완료되었습니다.</div>
        </div>
        <div class="row mt-5">
            <div class="col-6 offset-3">
                <div class="row">
                    <label class="col-2">사원번호</label>
                    <p class="col-6">${evo.eno}</p>
                </div>
                <div class="row">
                    <label class="col-2">직책</label>
                    <p class="col-6">${evo.position}</p>
                </div>
                <div class="row">
                    <label class="col-2">이름</label>
                    <p class="col-6">${evo.name}</p>
                </div>
                <div class="row">
                    <label class="col-2">전화번호</label>
                    <p class="col-6">${evo.phone1}-${evo.phone2}-${evo.phone3}</p>
                </div>
                <div class="row">
                    <label class="col-2">이메일</label>
                    <p class="col-6">${evo.email1}@${evo.email2}</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <button type="button" id="goToListBtn" class="btn btn-success">리스트로</button>
            </div>
        </div>
    </div>
</div>