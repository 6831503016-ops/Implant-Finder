
/* ==========================================================
   Back to Admin (.back-to-admin)
   แสดงปุ่มกลับไปหน้า Admin เมื่อเปิด User Preview
========================================================== */
(function () {

    // 1) ตรวจสอบสถานะ Admin Preview จาก sessionStorage
    try {
        if (sessionStorage.getItem('adminPreview') === '1') {

            // 2) ดึงปุ่ม Back to Admin จาก HTML
            const btn = document.getElementById('backToAdmin');

            // 3) แสดงปุ่ม Back to Admin
            if (btn) {
                btn.classList.add('is-visible');
            }
        }
    } catch (e) {
        // ไม่ทำอะไรหากไม่สามารถเข้าถึง sessionStorage ได้
    }
})();


/* ==========================================================
   Back to Admin (.back-to-admin)
   แสดงปุ่มกลับไปหน้า Admin เมื่อเปิด User Preview
========================================================== */
(function () {

    // 1) ตรวจสอบสถานะ Admin Preview จาก sessionStorage
    try {
        if (sessionStorage.getItem('adminPreview') === '1') {

            // 2) ดึงปุ่ม Back to Admin จาก HTML
            const btn = document.getElementById('backToAdmin');

            // 3) แสดงปุ่ม Back to Admin
            if (btn) {
                btn.classList.add('is-visible');
            }
        }
    } catch (e) {
        // ป้องกันข้อผิดพลาดในการเข้าถึง sessionStorage
    }

})();
