/* ==========================================================
   ปุ่มหูฟัง (.contact-btn) → เปิด popup อีเมล admin
   ใช้ทุกหน้า: Home, Models, ดูข้อมูลรากฟัน
========================================================== */
(function () {
    const btn = document.querySelector('.contact-btn');
    if (!btn || document.getElementById('contactPop')) return;

    // ✏️ เปลี่ยนอีเมล admin ที่นี่ที่เดียว (ใช้ทุกหน้า)
    const EMAIL = 'admin@implant.com';
    const HEADSET = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" '
        + 'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
        + '<path d="M4 14v-2a8 8 0 0 1 16 0v2"/><rect x="3" y="13" width="4" height="6" rx="1.5"/>'
        + '<rect x="17" y="13" width="4" height="6" rx="1.5"/><path d="M19 19c0 1.5-1.8 2.5-4 2.5h-2"/></svg>';

    // สร้าง popup
    const pop = document.createElement('div');
    pop.id = 'contactPop';
    pop.className = 'contact-popup hidden';
    pop.setAttribute('role', 'dialog');
    pop.setAttribute('aria-label', 'Contact admin');
    pop.innerHTML =
          '<div class="contact-arrow"></div>'
        + '<div class="contact-popup-heading">'
        +   '<div class="contact-popup-icon" aria-hidden="true">' + HEADSET + '</div>'
        +   '<div><p class="contact-popup-title">Contact Admin</p>'
        +   '<p class="contact-popup-subtitle">We usually reply within 1\u20132 days</p></div>'
        + '</div>'
        + '<div class="admin-email-row">'
        +   '<span class="admin-email">' + EMAIL + '</span>'
        +   '<button type="button" class="copy-btn">Copy</button>'
        + '</div>';
    document.body.appendChild(pop);

    const arrow = pop.querySelector('.contact-arrow');
    const copyBtn = pop.querySelector('.copy-btn');

    function position() {
        const b = btn.getBoundingClientRect();
        let right = window.innerWidth - b.right - 36;
        if (right < 8) right = 8;
        pop.style.top = (b.bottom + 12) + 'px';
        pop.style.right = right + 'px';
        pop.style.left = 'auto';

        const p = pop.getBoundingClientRect();
        let left = (b.left + b.width / 2) - p.left - 7;
        left = Math.max(24, Math.min(p.width - 24 - 14, left));
        arrow.style.left = left + 'px';
    }

    function close() {
        pop.classList.add('hidden');
        btn.setAttribute('aria-expanded', 'false');
    }

    // กดหูฟัง → เปิด/ปิด popup (ไม่เปิดโปรแกรมส่งอีเมล)
    btn.removeAttribute('onclick');
    btn.removeAttribute('href');
    btn.setAttribute('role', 'button');
    btn.setAttribute('tabindex', '0');
    btn.setAttribute('aria-expanded', 'false');
    btn.style.cursor = 'pointer';

    function toggle(e) {
        e.preventDefault();
        const open = pop.classList.toggle('hidden') === false;
        btn.setAttribute('aria-expanded', String(open));
        if (open) position();
    }
    btn.addEventListener('click', toggle);
    btn.addEventListener('keydown', e => { if (e.key === 'Enter' || e.key === ' ') toggle(e); });

    copyBtn.addEventListener('click', () => {
        navigator.clipboard.writeText(EMAIL).then(() => {
            copyBtn.textContent = 'Copied!';
            setTimeout(() => copyBtn.textContent = 'Copy', 1500);
        }).catch(() => { copyBtn.textContent = 'Select & copy'; });
    });

    document.addEventListener('click', e => {
        if (!btn.contains(e.target) && !pop.contains(e.target)) close();
    });
    document.addEventListener('keydown', e => { if (e.key === 'Escape') close(); });
    window.addEventListener('resize', () => { if (!pop.classList.contains('hidden')) position(); });
    window.addEventListener('scroll', close);
})();