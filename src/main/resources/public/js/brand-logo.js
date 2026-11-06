
/* ==========================================================
   Brand Logo
   แสดงชื่อแบรนด์แทนเมื่อรูปภาพโลโก้โหลดไม่สำเร็จ
========================================================== */

document.querySelectorAll('.brand-logo').forEach(image => {

    image.addEventListener('error', () => {

        // ซ่อนรูปภาพที่โหลดไม่สำเร็จ
        image.style.display = 'none';

        // แสดงชื่อแบรนด์แทนรูปภาพ
        const fallback = image.nextElementSibling;

        if (fallback) {
            fallback.classList.remove('hidden');
        }
    });
});
