
/* ==========================================================
   Page Navigation
   จัดการปุ่มย้อนกลับของหน้า Model Detail
========================================================== */
(function () {

    // 1) ดึงปุ่มย้อนกลับจาก HTML
    const backButton = document.getElementById('pageBackButton');

    // ตรวจสอบว่ามีปุ่มย้อนกลับในหน้านี้หรือไม่
    if (!backButton) return;

    // 2) ตรวจจับเมื่อผู้ใช้คลิกปุ่มย้อนกลับ
    backButton.addEventListener('click', e => {

        try {
            // ตรวจสอบว่าหน้าก่อนหน้าอยู่ในเว็บไซต์เดียวกันหรือไม่
            const sameOrigin = document.referrer
                && new URL(document.referrer).origin === window.location.origin;

            // ตรวจสอบว่ามีประวัติการเข้าชมก่อนหน้าหรือไม่
            const canGoBack = window.history.length > 1;

            // 3) หากเป็นหน้าในเว็บไซต์เดียวกัน ให้ย้อนกลับหน้าก่อนหน้า
            if (sameOrigin && canGoBack) {
                e.preventDefault();
                window.history.back();
            }

            // หากไม่ตรงเงื่อนไข จะใช้ href ของปุ่มตามปกติ

        } catch (err) {
            // หากเกิดข้อผิดพลาด ให้ใช้ href ตามปกติ
        }
    });

})();
