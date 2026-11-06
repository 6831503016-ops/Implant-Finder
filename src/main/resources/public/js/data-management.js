
/* ==========================================================
   Data Management
   จัดการการทำงานเพิ่มเติมในหน้า Implant Data Management
========================================================== */

// 1. จัดการ Size Dropdown
document.addEventListener('click', event => {

    const openDropdowns = document.querySelectorAll(
        '.size-dropdown[open]'
    );

    openDropdowns.forEach(dropdown => {

        // ปิด Dropdown เมื่อคลิกด้านนอก
        if (!dropdown.contains(event.target)) {
            dropdown.removeAttribute('open');
        }
    });
});


// 2. จัดการรูปภาพที่โหลดไม่สำเร็จ
document.querySelectorAll('.dm-thumb img').forEach(image => {

    image.addEventListener('error', () => {

        // ซ่อนรูปภาพเมื่อไม่สามารถโหลดได้
        image.style.visibility = 'hidden';
    });
});


// 3. ยืนยันก่อนลบโมเดล
document.querySelectorAll('.icon-btn-delete').forEach(button => {

    button.addEventListener('click', event => {

        const confirmed = window.confirm('Delete model?');

        // ยกเลิกการส่ง Form หากผู้ใช้กด Cancel
        if (!confirmed) {
            event.preventDefault();
        }
    });
});
