// เช็กรหัสผ่านในหน้า Profile ก่อนกด Save
// 1) New password ต้องยาว 6–10 ตัว
// 2) Confirm password ต้องตรงกับ New password
// ถ้าไม่ผ่าน เบราว์เซอร์จะขึ้นกล่องเตือน (แบบ "Please fill out this field.") แต่เป็นข้อความของเรา
(function () {
    var MIN_LENGTH = 6;
    var MAX_LENGTH = 10;
    var LENGTH_MESSAGE = 'Password must be ' + MIN_LENGTH + '–' + MAX_LENGTH + ' characters.';
    var MATCH_MESSAGE = 'Passwords do not match.';

    var newInput = document.getElementById('newPassword');
    var confirmInput = document.getElementById('confirmPassword');
    if (!newInput || !confirmInput) return;

    function checkLength() {
        var len = newInput.value.length;
        // ปล่อยว่างได้ (= ไม่เปลี่ยนรหัส) แต่ถ้ากรอกแล้วต้องยาว 6–10 ตัว
        var bad = len > 0 && (len < MIN_LENGTH || len > MAX_LENGTH);
        newInput.setCustomValidity(bad ? LENGTH_MESSAGE : '');
    }

    function checkMatch() {
        // ถ้ากรอกช่องไหนช่องหนึ่งแล้ว สองช่องต้องเหมือนกัน
        var filled = newInput.value.length > 0 || confirmInput.value.length > 0;
        var bad = filled && newInput.value !== confirmInput.value;
        confirmInput.setCustomValidity(bad ? MATCH_MESSAGE : '');
    }

    newInput.addEventListener('input', function () { checkLength(); checkMatch(); });
    confirmInput.addEventListener('input', checkMatch);
    newInput.addEventListener('invalid', checkLength);
    confirmInput.addEventListener('invalid', checkMatch);

    checkLength();
    checkMatch();
})();