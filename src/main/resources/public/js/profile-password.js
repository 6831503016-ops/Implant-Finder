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

// ปุ่มรูปตา: แสดงหรือซ่อน Password (แบบเดียวกับหน้า Admin Login)
// ใช้ได้กับทุกปุ่ม .toggle-password ที่มี data-target = id ของช่อง Password
(function () {
    // ไอคอนตาเปิด (กำลังแสดง Password)
    var SHOW_ICON =
        '<path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/>' +
        '<circle cx="12" cy="12" r="3"/>';

    // ไอคอนตาปิด (กำลังซ่อน Password)
    var HIDE_ICON =
        '<path d="M3 3l18 18"/>' +
        '<path d="M10.6 10.6a2 2 0 0 0 2.8 2.8"/>' +
        '<path d="M9.9 5.2A11.5 11.5 0 0 1 12 5c6.4 0 10 7 10 7a16.7 16.7 0 0 1-4 4.8"/>' +
        '<path d="M6.6 6.6C3.6 8.4 2 12 2 12s3.6 7 10 7a10.9 10.9 0 0 0 3.4-.5"/>';

    var buttons = document.querySelectorAll('.toggle-password[data-target]');

    buttons.forEach(function (button) {
        var input = document.getElementById(button.getAttribute('data-target'));
        var icon = button.querySelector('svg');
        if (!input || !icon) return;

        button.addEventListener('click', function () {
            // ถ้าตอนนี้ซ่อนอยู่ ให้แสดง / ถ้าแสดงอยู่ ให้ซ่อน
            var show = input.type === 'password';

            input.type = show ? 'text' : 'password';
            button.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
            button.setAttribute('aria-pressed', String(show));
            icon.innerHTML = show ? SHOW_ICON : HIDE_ICON;

            // ให้เคอร์เซอร์อยู่ในช่องเดิม พิมพ์ต่อได้ทันที
            input.focus();
        });
    });
})();