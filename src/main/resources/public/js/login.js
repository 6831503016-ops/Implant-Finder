/* ==========================================================
   Admin Login
   แสดงหรือซ่อน Password
========================================================== */

// ดึง Element ที่ใช้ควบคุม Password
const passwordInput = document.getElementById('passInput');
const toggleButton = document.getElementById('togglePassButton');
const eyeIcon = document.getElementById('eyeIcon');

// SVG สำหรับไอคอนแสดง Password
const showIcon = `
    <path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/>
    <circle cx="12" cy="12" r="3"/>
`;

// SVG สำหรับไอคอนซ่อน Password
const hideIcon = `
    <path d="M3 3l18 18"/>
    <path d="M10.6 10.6a2 2 0 0 0 2.8 2.8"/>
    <path d="M9.9 5.2A11.5 11.5 0 0 1 12 5c6.4 0 10 7 10 7a16.7 16.7 0 0 1-4 4.8"/>
    <path d="M6.6 6.6C3.6 8.4 2 12 2 12s3.6 7 10 7a10.9 10.9 0 0 0 3.4-.5"/>
`;

// ตรวจสอบว่ามี Element ครบก่อนเพิ่ม Event
if (passwordInput && toggleButton && eyeIcon) {

    // ตรวจสอบเมื่อผู้ใช้คลิกปุ่มแสดงหรือซ่อน Password
    toggleButton.addEventListener('click', () => {

        // ตรวจสอบสถานะปัจจุบันของ Password
        const show = passwordInput.type === 'password';

        // เปลี่ยนประเภท Input
        passwordInput.type = show ? 'text' : 'password';

        // เปลี่ยนคำอธิบายปุ่มสำหรับ Accessibility
        toggleButton.setAttribute(
            'aria-label',
            show ? 'Hide password' : 'Show password'
        );

        // อัปเดตสถานะของปุ่ม
        toggleButton.setAttribute('aria-pressed', String(show));

        // เปลี่ยนไอคอนรูปตา
        eyeIcon.innerHTML = show ? showIcon : hideIcon;
    });
}