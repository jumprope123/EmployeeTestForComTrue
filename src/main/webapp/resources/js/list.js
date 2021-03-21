$('#FindBtn').on('click',function () {

    var findkey = $('#findkey').val();
    if (findkey == ""){
        alert("검색하실 내용을 입력하세요");
    }else {
        var param = '?findtype=' + $('#findtype').val();
        param += '&findkey=' + $('#findkey').val();
        location.href = "/find" + param + '&cp=1';
    }
})

function modifyData(eno) {
    location.href = "/modifyData?eno="+eno;
}

function delData(eno) {
    if (confirm('정말 삭제하시겠습니까?')) {
        location.href = "/delData?eno=" + eno;
    } else {
        return;
    }
}

$('#addEmpBtn').on('click',function () {
    location.href = "/write"
})