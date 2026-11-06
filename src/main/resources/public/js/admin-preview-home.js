
/* ==========================================================
   Admin Preview Home
   จัดการสถานะ Admin Preview ในหน้า Homepage
========================================================== */
(function () {

    // 1) บันทึกสถานะว่าเว็บไซต์กำลังเปิดในโหมด Admin Preview
    try {
        sessionStorage.setItem('adminPreview', '1');
    } catch (e) {
        // ป้องกันข้อผิดพลาดหากไม่สามารถเข้าถึง sessionStorage ได้
    }

    // 2) ดึงปุ่ม Back to Admin จาก HTML
    const backButton = document.getElementById('backToAdmin');

    // 3) เมื่อต้องการกลับไปหน้า Admin ให้ลบสถานะ Preview
    if (backButton) {
        backButton.addEventListener('click', function () {
            try {
                sessionStorage.removeItem('adminPreview');
            } catch (e) {
                // ป้องกันข้อผิดพลาดในการเข้าถึง sessionStorage
            }
        });
    }

})();
