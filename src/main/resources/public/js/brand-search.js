
/* ==========================================================
   Brand Search
   ค้นหาแบรนด์จากชื่อที่ขึ้นต้นด้วยข้อความที่พิมพ์
========================================================== */
(function () {

    // 1) ดึงช่องค้นหาและข้อความแจ้งเตือนเมื่อไม่พบแบรนด์
    const searchInput = document.getElementById('searchInput');
    const noBrand = document.getElementById('noBrand');

    // 2) หยุดการทำงานหากไม่พบ element ที่ต้องใช้
    if (!searchInput || !noBrand) return;

    // 3) ตรวจจับเมื่อผู้ใช้พิมพ์ข้อความในช่องค้นหา
    searchInput.addEventListener('input', function () {

        // รับข้อความค้นหาและแปลงเป็นตัวพิมพ์เล็ก
        const query = searchInput.value.toLowerCase().trim();

        // ตัวแปรนับจำนวนแบรนด์ที่ตรงกับคำค้นหา
        let shown = 0;

        // 4) ตรวจสอบการ์ดแบรนด์ทั้งหมด
        document.querySelectorAll('.brand-card').forEach(card => {

            // อ่านชื่อแบรนด์จาก data-name
            const name = (card.dataset.name || '').toLowerCase().trim();

            // ตรวจสอบว่าชื่อแบรนด์ขึ้นต้นด้วยข้อความค้นหาหรือไม่
            const matches = name.startsWith(query);

            // แสดงหรือซ่อนการ์ดตามผลการค้นหา
            card.style.display = matches ? '' : 'none';

            // เพิ่มจำนวนเมื่อพบแบรนด์ที่ตรงกัน
            if (matches) shown++;
        });

        // 5) แสดงข้อความเมื่อไม่พบแบรนด์
        noBrand.classList.toggle('hidden', shown > 0);
    });

})();
