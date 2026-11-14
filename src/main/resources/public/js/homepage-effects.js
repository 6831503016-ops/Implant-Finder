/* ==========================================================
   Homepage Effects
   จัดการเอฟเฟกต์ Navbar และการแสดงผลเมื่อเลื่อนหน้า
========================================================== */
(function () {

    // 2) ดึง Navbar จาก HTML
    const topbar = document.querySelector('.topbar');

    // หยุดการทำงานหากไม่พบ Navbar
    if (!topbar) return;

    // 3) จัดการเงาของ Navbar เมื่อเลื่อนหน้า
    let ticking = false;

    function onScroll() {

        // ป้องกันการเรียกใช้ฟังก์ชันซ้ำมากเกินไป
        if (ticking) return;

        ticking = true;

        // ใช้ requestAnimationFrame เพื่อให้การเปลี่ยนแปลงลื่นไหล
        requestAnimationFrame(() => {

            // เพิ่ม class เมื่อเลื่อนลงเกิน 8 pixels
            topbar.classList.toggle('is-scrolled', window.scrollY > 8);

            ticking = false;
        });
    }

    // เรียกใช้งานทันทีและตรวจจับการเลื่อนหน้า
    onScroll();
    window.addEventListener('scroll', onScroll, { passive: true });

    // 4) หากเบราว์เซอร์ไม่รองรับ IntersectionObserver ให้หยุดการทำงานส่วนนี้
    if (!('IntersectionObserver' in window)) return;

    // 5) ดึงหัวข้อ Brands และการ์ดแบรนด์ทั้งหมด
    const title = document.querySelector('.brands-title');
    const cards = Array.from(document.querySelectorAll('.brand-card'));

    // หยุดหากไม่พบหัวข้อ
    if (!title) return;

    // 6) เพิ่ม class reveal เพื่อเตรียมเอฟเฟกต์
    title.classList.add('reveal');
    cards.forEach(card => card.classList.add('reveal'));

    // 7) สร้าง IntersectionObserver เพื่อตรวจจับ element
    // เมื่อเลื่อนเข้ามาในพื้นที่ที่กำหนด
    const observer = new IntersectionObserver(entries => {

        entries.filter(entry => entry.isIntersecting).forEach((entry, i) => {

            const element = entry.target;

            // กำหนดระยะเวลาหน่วงของแต่ละ element
            element.style.transitionDelay = (i * 80) + 'ms';

            // เพิ่ม class เพื่อเริ่มเอฟเฟกต์
            element.classList.add('is-in');

            // หยุดตรวจจับ element ที่แสดงแล้ว
            observer.unobserve(element);

            // 8) เมื่อตัวที่แสดงเป็นการ์ดแบรนด์
            if (element.classList.contains('brand-card')) {

                // รอให้เอฟเฟกต์ทำงานเสร็จก่อนล้าง class
                setTimeout(() => {

                    element.style.animation = 'none';
                    element.classList.remove('reveal', 'is-in');
                    element.style.transitionDelay = '';

                }, 700 + i * 80);
            }
        });

    }, {
        threshold: 0.15,
        rootMargin: '0px 0px -40px 0px'
    });

    // 9) เริ่มตรวจจับหัวข้อและการ์ดแบรนด์
    observer.observe(title);
    cards.forEach(card => observer.observe(card));

})();