<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- 페이지당 게시물 수 30으로 설정--%>
<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="30"/>
<fmt:parseNumber var="dataCnt" value="${dataCnt}"/>

<fmt:parseNumber var="sp" value="${((cp-1) / 10)}" integerOnly="true"/>
<fmt:parseNumber var="sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${dataCnt/pp}" integerOnly="true"/>
<c:if test="${(dataCnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<fmt:parseNumber var="snum" value="${dataCnt - (cp - 1) * pp}" integerOnly="true"/>

<%-- 검색 여부에 따라 네비게이션 링크 출력을 다르게 함 --%>
<c:set var="navlnk" value="/list?cp="/>
<c:if test="${not empty param.findkey}">
    <c:set var="navlnk" value="/list?findtype=${param.findtype}&findkey=${param.findkey}&cp="/>
</c:if>

<div id="main">
    <div class="margin1050">
        <div class="row mt-5 text-danger">
            <div class="col-12 text-center">이름순으로 30명씩 오름차순 정렬하였습니다.</div>
        </div>
        <div class="row mt-3">
            <div class="col-6 offset-3 text-center">
                <div class="form-group row">
                    <select name="findtype" id="findtype" class="form-control col-4">
                        <option value="eno">직원번호</option>
                        <option value="position">직책</option>
                        <option value="name">이름</option>
                        <option value="phone2">핸드폰 가운데자리</option>
                        <option value="email1">이메일@ 전까지</option>
                    </select>
                    <input type="text" name="findkey" id="findkey" class="form-control col-5">
                    <button type="button" id="FindBtn" class="btn btn-dark"><i class="bi bi-search"></i>검색하기</button>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12 text-right">
                <button id="addEmpBtn" class="btn btn-success">직원추가</button>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <td>직원번호</td>
                        <td>직책</td>
                        <td>이름</td>
                        <td>핸드폰</td>
                        <td>이메일</td>
                        <td></td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="d" items="${data}">
                        <tr>
                            <td>
                                <c:if test="${d.eno<10}">00${d.eno}</c:if>
                                <c:if test="${d.eno>9 and d.eno<100}">0${d.eno}</c:if>
                            </td>
                            <td>
                                <c:if test="${d.position eq 'staff'}">사원</c:if>
                                <c:if test="${d.position eq 'astManager'}">대리</c:if>
                                <c:if test="${d.position eq 'manager'}">과장</c:if>
                                <c:if test="${d.position eq 'snManager'}">차장</c:if>
                                <c:if test="${d.position eq 'HManager'}">부장</c:if>
                                <c:if test="${d.position eq 'President'}">사장</c:if>
                            </td>
                            <td>${d.name}</td>
                            <td>${d.phone1}-${d.phone2}-${d.phone3}</td>
                            <td>${d.email1}@${d.email2}</td>
                            <td><button class="btn btn-warning" onclick="javascript:modifyData(${d.eno})">수정하기</button></td>
                            <td><button class="btn btn-danger" onclick="javascript:delData(${d.eno})">삭제하기</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%--하단 페이지 바--%>
        <div class="row mt-5">
            <div class="col-12 text-center">
                <ul class="pagination justify-content-center">
                    <%--'이전'이 표시되어야 할 때는 cp > 10 --%>
                    <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                        <a href="${navlnk}${sp - 10}" class="page-link">이전</a></li>

                    <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                        <c:if test="${i le tp}">
                            <c:if test="${i ne cp}">
                                <li class="page-item"><a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                            </c:if>

                            <c:if test="${i eq cp}">
                                <li class="page-item active"><a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                            </c:if>
                        </c:if>
                    </c:forEach>

                    <%--'다음'이 표시되어야 할 때는 ?--%>
                    <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                        <a href="${navlnk}${sp+10}" class="page-link">다음</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
