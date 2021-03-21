$(document).ready(function () {
    var modiEno = $('#modiEno').val();
    var modiPosition = $('#modiPosition').val();
    var modiName = $('#modiName').val();
    var modiPhone1 = $('#modiPhone1').val();
    var modiPhone2 = $('#modiPhone2').val();
    var modiPhone3 = $('#modiPhone3').val();
    var modiEmail1 = $('#modiEmail1').val();
    var modiEmail2 = $('#modiEmail2').val();

    $('#inputEnoMod').val(modiEno);

    if (modiPosition =='staff'){
        $('#1').attr("selected",true);
    }else if (modiPosition =='astManager'){
        $('#2').attr("selected",true);
    }else if (modiPosition =='manager'){
        $('#3').attr("selected",true);
    }else if (modiPosition =='snManager'){
        $('#4').attr("selected",true);
    }else if (modiPosition =='HManager'){
        $('#5').attr("selected",true);
    }else if (modiPosition =='President'){
        $('#6').attr("selected",true);
    }

    $('#inputNameMod').val(modiName);
    $('#inputPhone1Mod').val(modiPhone1);
    $('#inputPhone2Mod').val(modiPhone2);
    $('#inputPhone3Mod').val(modiPhone3);
    $('#inputEmail1Mod').val(modiEmail1);
    $('#inputEmail2Mod').val(modiEmail2);

})


$('#emailAddMod').on('change',function () {
    let val = $('#emailAddMod option:selected').text();

    if (val == '직접입력'){
        $('#inputEmail2Mod').attr('readonly', false);
        $('#inputEmail2Mod').val('');
    }else {
        $('#inputEmail2Mod').attr('readonly', true);
        $('#inputEmail2Mod').val(val);
    }
})// 이메일 .com부분


$('#inputOkBtnMod').on('click',function () {

    // 직원번호 입력(중복아직미구현)
    if (inputEnoMod<1 || inputEnoMod>1000){
        alert('직원번호는 1~1000까지만 가능합니다');
        return;
    }

    //이름 확인 정규식
    var inputName = $('#inputNameMod').val();
    var checkName = RegExp(/^[a-zA-Z-가-힣]+$/);
    if (!checkName.test(inputName)){
        alert('이름을 확인하세요');
        $('#inputNameMod').val('');
        return;
    }

    //전화번호 확인 정규식
    var inputPhone2 = $('#inputPhone2Mod').val();
    var inputPhone3 = $('#inputPhone3Mod').val();
    var checkNum2 = RegExp(/^[0-9]{3,4}$/)
    var checkNum3 = RegExp(/^[0-9]{3,4}$/)
    if (!checkNum2.test(inputPhone2)){
        alert('전화번호를 확인하세요');
        $('#inputPhone2Mod').val('');
        return;
    }
    if (!checkNum3.test(inputPhone3)){
        alert('전화번호를 확인하세요');
        $('#inputPhone3Mod').val('');
        return;
    }

    var email1 = $('#inputEmail1Mod').val()
    var checkemail1 = RegExp(/^[a-zA-Z0-9_\.\-]+$/);
    if (!checkemail1.test(email1)){
        alert('메일주소의 형식이 올바르지 않습니다.');
        $('#email1Mod').val('');
        return;
    }

    //eno값이 바뀐건가 확인하기
    var modiEno = $('#modiEno').val(); //처음 가져온 eno
    var inputEnoMod = $('#inputEnoMod').val(); //전송하는 eno

    //각각의 경우 return을 걸어두었으므로 모두 통과시 데이터 전송.
    $('#inputFormMod').attr('method','post');

    if (modiEno != inputEnoMod) { //eno값이 변경되었다면
        $('#inputFormMod').attr('action', '/modiOk?beforeEno='+modiEno+"&afterEno="+inputEnoMod);
    }else { //변경되지 않았다면
        $('#inputFormMod').attr('action','/modiOk');
    }

    $('#inputFormMod').submit();

})