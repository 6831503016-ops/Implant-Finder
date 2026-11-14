/* =========================================================
   tilt.js — เอียงแบบ 3D ตามเมาส์
   ใช้กับทุก element ที่มี data-tilt (ใส่ตัวเลข = องศาสูงสุด เช่น data-tilt="8")
   - ตั้งค่า CSS variables: --rx, --ry (องศาเอียง), --px, --py (ตำแหน่งแสงสะท้อน)
   - ใส่ class "is-tilting" ตอนเมาส์อยู่บน element
   ทำงานเฉพาะเครื่องที่มีเมาส์
========================================================= */
(function () {
    const hasMouse = window.matchMedia('(hover: hover) and (pointer: fine)').matches;
    if (!hasMouse) return;

    document.querySelectorAll('[data-tilt]').forEach(el => {
        const maxDeg = parseFloat(el.dataset.tilt) || 8;
        let frame = null;

        el.addEventListener('pointermove', e => {
            const r = el.getBoundingClientRect();
            const x = (e.clientX - r.left) / r.width;   // 0 = ซ้าย, 1 = ขวา
            const y = (e.clientY - r.top) / r.height;   // 0 = บน, 1 = ล่าง

            if (frame) cancelAnimationFrame(frame);
            frame = requestAnimationFrame(() => {
                el.style.setProperty('--rx', ((0.5 - y) * maxDeg * 2).toFixed(2) + 'deg');
                el.style.setProperty('--ry', ((x - 0.5) * maxDeg * 2).toFixed(2) + 'deg');
                el.style.setProperty('--px', (x * 100).toFixed(1) + '%');
                el.style.setProperty('--py', (y * 100).toFixed(1) + '%');
            });
            el.classList.add('is-tilting');
        });

        el.addEventListener('pointerleave', () => {
            if (frame) cancelAnimationFrame(frame);
            el.classList.remove('is-tilting');
            el.style.setProperty('--rx', '0deg');
            el.style.setProperty('--ry', '0deg');
        });
    });
})();