
/* ==========================================================
   Size Selection
   จัดการการเลือกขนาด Implant และแสดงรายละเอียดของแต่ละขนาด
========================================================== */
(function () {

    // 1) รับข้อมูลจาก HTML ที่ส่งมาจาก Thymeleaf
    const raw = document.body.dataset.visibleSizes || '';
    const modelName = document.body.dataset.modelName || '';
    const imageUrl = document.body.dataset.imageUrl || '';

    // 2) แปลงข้อความขนาด Implant ให้อยู่ในรูปแบบที่จัดการได้
    // ตัวอย่าง "Ø 3 x 8 mm (note)" → Diameter, Length และ Notes
    const re = /Ø\s*([\d.]+)\s*x\s*([\d.]+)\s*mm(?:\s*\(([^)]*)\))?/g;

    const sizes = new Map();
    let m;

    // 3) แยก Diameter และ Length ออกจากข้อความ
    while (raw && (m = re.exec(raw)) !== null) {
        const d = parseFloat(m[1]);
        const l = parseFloat(m[2]);

        // สร้าง Map สำหรับ Diameter หากยังไม่มี
        if (!sizes.has(d)) sizes.set(d, new Map());

        // สร้างรายการ Length ภายใต้ Diameter นั้น
        if (!sizes.get(d).has(l)) sizes.get(d).set(l, []);

        // เก็บหมายเหตุของขนาด (ถ้ามี)
        if (m[3]) sizes.get(d).get(l).push(m[3]);
    }

    // 4) รวมขนาดทั้งหมดและเรียงจากเล็กไปใหญ่
    const allSizes = [];

    [...sizes.keys()].sort((a, b) => a - b).forEach(d => {
        [...sizes.get(d).keys()].sort((a, b) => a - b).forEach(l => {
            allSizes.push({
                d,
                l,
                notes: sizes.get(d).get(l)
            });
        });
    });

    // 5) สร้าง URL สำหรับเปิดรายละเอียดของขนาดที่เลือก
    const sizeUrl = s => window.location.pathname
        + '?diameter=' + encodeURIComponent(s.d)
        + '&length=' + encodeURIComponent(s.l);

    // 6) ดึงพื้นที่สำหรับแสดงการ์ดเลือกขนาด
    const sizeCards = document.getElementById('sizeCards');

    // สร้างการ์ดสำหรับแต่ละขนาด
    allSizes.forEach(s => {
        const card = document.createElement('a');
        const box = document.createElement('div');
        const img = document.createElement('img');
        const fallback = document.createElement('span');
        const body = document.createElement('div');
        const size = document.createElement('p');
        const title = document.createElement('p');

        // กำหนด Class และ URL ให้การ์ด
        card.className = 'size-card';
        card.href = sizeUrl(s);

        // สร้างส่วนรูปภาพของการ์ด
        box.className = 'size-card-image';
        img.src = imageUrl;
        img.alt = modelName;
        img.loading = 'lazy';

        // รูปสำรองเมื่อโหลดรูปภาพไม่สำเร็จ
        fallback.textContent = '🦷';
        fallback.hidden = true;

        img.onerror = () => {
            img.style.display = 'none';
            fallback.hidden = false;
        };

        box.append(img, fallback);

        // สร้างส่วนข้อมูลขนาด
        body.className = 'size-card-body';

        size.className = 'size-card-size';
        size.textContent = 'Ø ' + s.d + ' x ' + s.l + ' mm';

        title.className = 'size-card-title';
        title.textContent = modelName;

        body.append(size, title);

        // 7) สร้างปุ่ม View details
        const cta = document.createElement('span');
        cta.className = 'size-card-cta';

        cta.innerHTML = 'View details <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
            + 'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14m-6-6 6 6-6 6"/></svg>';

        // แสดงหมายเหตุของขนาด (ถ้ามี)
        if (s.notes.length) {
            const variant = document.createElement('p');
            variant.className = 'size-card-variant';
            variant.textContent = s.notes.join(' · ');
            body.append(variant);
        }

        body.append(cta);
        card.append(box, body);
        sizeCards.append(card);
    });

    // 8) ตรวจสอบขนาดที่ผู้ใช้เลือกจาก URL
    const params = new URLSearchParams(window.location.search);

    const selD = Number(params.get('diameter'));
    const selL = Number(params.get('length'));

    const hasSizes = allSizes.length > 0;

    const validSelection = hasSizes
        && sizes.has(selD)
        && sizes.get(selD).has(selL);

    const sizePicker = document.getElementById('sizePicker');
    const detailView = document.getElementById('detailView');

    // 9) แสดงรายละเอียดตามขนาดที่เลือก
    if (validSelection) {

        // ซ่อนหน้าเลือกขนาดและแสดงหน้ารายละเอียด
        sizePicker.hidden = true;
        detailView.hidden = false;

        // เปลี่ยนปุ่มย้อนกลับให้กลับไปหน้าเลือกขนาด
        const back = document.getElementById('pageBackButton');
        back.href = window.location.pathname;
        back.title = 'Back to sizes';
        back.setAttribute('aria-label', 'Back to sizes');

        // แสดงขนาดที่เลือก
        const text = selD + ' x ' + selL + ' mm';
        document.getElementById('selected').textContent = text;

        // แสดง Variant หรือหมายเหตุของขนาด
        const notes = sizes.get(selD).get(selL);

        document.getElementById('variants').textContent =
            notes.length ? '(' + notes.join(' · ') + ')' : '';

        // แสดงขนาดใน Breadcrumb
        document.getElementById('breadcrumbSize').textContent = 'Ø ' + text;
        document.getElementById('breadcrumbSizeWrapper').hidden = false;

        // เปลี่ยนสถานะ Model ให้ไม่ใช่หน้าปัจจุบัน
        document.getElementById('crumbModel').classList.remove('is-current');

    } else if (!hasSizes) {

        // ไม่มีข้อมูลขนาด → แสดงหน้ารายละเอียดเลย (Size = "-")
        sizePicker.hidden = true;
        detailView.hidden = false;

    } else {

        // 10) แสดงจำนวนขนาดทั้งหมดในแบนเนอร์
        const count = document.getElementById('sizeCount');

        count.textContent = allSizes.length
            + (allSizes.length === 1 ? ' size' : ' sizes');

        count.hidden = false;
    }

})();
