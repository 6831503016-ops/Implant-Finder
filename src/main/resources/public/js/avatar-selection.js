
/* ==========================================================
   Avatar Selection
   เปลี่ยนรูป Preview เมื่อผู้ใช้เลือก Avatar
========================================================== */

// ดึงรูป Preview ด้านบน
const avatarPreview = document.getElementById('avatarPreview');

// ดึง Radio Button สำหรับเลือก Avatar
const avatarOptions = document.querySelectorAll(
    '.avatar-option input'
);

// ตรวจสอบว่ามีรูป Preview และตัวเลือก Avatar หรือไม่
if (avatarPreview && avatarOptions.length > 0) {

    // ตรวจสอบเมื่อผู้ใช้เลือก Avatar
    avatarOptions.forEach(input => {

        input.addEventListener('change', () => {

            // ค้นหารูปภาพภายในตัวเลือกที่ถูกเลือก
            const avatarImage = input
                .closest('.avatar-option')
                .querySelector('.avatar-image');

            // เปลี่ยนรูป Preview ให้ตรงกับ Avatar ที่เลือก
            if (avatarImage) {
                avatarPreview.src = avatarImage.src;
            }
        });
    });
}
