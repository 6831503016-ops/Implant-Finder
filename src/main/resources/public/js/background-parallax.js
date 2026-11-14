/* ==========================================================
   Background Parallax
   ทำให้ก้อนสีพื้นหลังขยับตามตำแหน่งเมาส์
========================================================== */
(function () {

    // 1) ดึง Section และพื้นหลังภายใน Section
    const section = document.getElementById('hero');
    const background = section && section.querySelector('.hero-bg');

    // 2) ตรวจสอบว่าอุปกรณ์รองรับการใช้เมาส์หรือไม่
    const canHover = window.matchMedia(
        '(hover: hover) and (pointer: fine)'
    ).matches;

    // หยุดการทำงานหากไม่ตรงตามเงื่อนไข
    if (!background || !canHover) return;

    // 4) ตรวจจับเมื่อเมาส์เคลื่อนที่ภายใน Section
    section.addEventListener('pointermove', event => {

        // หาขนาดและตำแหน่งของ Section
        const rect = section.getBoundingClientRect();

        // คำนวณตำแหน่งเมาส์
        const x = (event.clientX - rect.left) / rect.width - 0.5;
        const y = (event.clientY - rect.top) / rect.height - 0.5;

        // กำหนดระยะการขยับผ่าน CSS variables
        background.style.setProperty('--hx', (x * -24).toFixed(1) + 'px');
        background.style.setProperty('--hy', (y * -16).toFixed(1) + 'px');
    });

    // 5) เมื่อเมาส์ออกจาก Section ให้พื้นหลังกลับตำแหน่งเดิม
    section.addEventListener('pointerleave', () => {

        background.style.setProperty('--hx', '0px');
        background.style.setProperty('--hy', '0px');

    });

})();