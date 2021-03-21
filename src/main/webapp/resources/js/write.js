$('#emailAdd').on('change',function () {
    let val = $('#emailAdd option:selected').text();

    if (val == '직접입력'){
        $('#inputEmail2').attr('readonly', false);
        $('#inputEmail2').val('');
    }else {
        $('#inputEmail2').attr('readonly', true);
        $('#inputEmail2').val(val);
    }
})// 이메일 .com부분


$('#inputOkBtn').on('click',function () {

    //이름 확인 정규식
    var inputName = $('#inputName').val();
    var checkName = RegExp(/^[a-zA-Z-가-힣]+$/);
    if (!checkName.test(inputName)){
        alert('이름을 확인하세요');
        $('#inputName').val('');
        return;
    }

    //전화번호 확인 정규식
    var inputPhone2 = $('#inputPhone2').val();
    var inputPhone3 = $('#inputPhone3').val();
    var checkNum2 = RegExp(/^[0-9]{3,4}$/)
    var checkNum3 = RegExp(/^[0-9]{3,4}$/)
    if (!checkNum2.test(inputPhone2)){
        alert('전화번호를 확인하세요');
        $('#inputPhone2').val('');
        return;
    }
    if (!checkNum3.test(inputPhone3)){
        alert('전화번호를 확인하세요');
        $('#inputPhone3').val('');
        return;
    }

    var email1 = $('#inputEmail1').val()
    var checkemail1 = RegExp(/^[a-zA-Z0-9_\.\-]+$/);
    if (!checkemail1.test(email1)){
        alert('메일주소의 형식이 올바르지 않습니다.');
        $('#email1').val('');
        return;
    }

    //각각의 경우 return을 걸어두었으므로 모두 통과시 데이터 전송.
    $('#inputForm').attr('method','post');
    $('#inputForm').attr('action','/writeOk');
    $('#inputForm').submit();

})

$('#goToListBtn').on('click',function () {
    location.href = '/list?cp=1';
})