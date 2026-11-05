/* =========================================================
   model-form.js — ใช้ร่วมกันในหน้า Add Implant Model และ Edit Model
   - พรีวิวรูปจาก Image URL
   - เพิ่ม/ลบขนาด (Diameter + Lengths) เป็นชิป แล้วเก็บลง input ซ่อน #sizes
========================================================= */
(function () {
    // ---------- พรีวิวรูป ----------
    const imageUrlInput = document.getElementById('imageUrl');
    const preview = document.getElementById('imagePreview');
    const placeholder = document.getElementById('imagePlaceholder');

    function showPreview(url) {
        if (!preview) return;
        if (url) {
            preview.src = url;
            preview.hidden = false;
            if (placeholder) placeholder.hidden = true;
        } else if (placeholder) {
            preview.hidden = true;
            placeholder.hidden = false;
        }
    }

    if (preview) {
        preview.addEventListener('error', () => {
            preview.hidden = true;
            if (placeholder) placeholder.hidden = false;
        });
    }

    if (imageUrlInput) {
        imageUrlInput.addEventListener('input', () => showPreview(imageUrlInput.value.trim()));
    }

    // ---------- ขนาด ----------
    const hiddenSizes = document.getElementById('sizes');
    if (!hiddenSizes) return;

    const diameterInput = document.getElementById('diameterInput');
    const lengthsInput = document.getElementById('lengthsInput');
    const addSizeButton = document.getElementById('addSizeBtn');
    const clearAllButton = document.getElementById('clearAllBtn');
    const sizeError = document.getElementById('sizeError');
    const sizeChips = document.getElementById('sizeChips');
    const chipCount = document.getElementById('chipCount');
    const sizeToolbar = document.getElementById('sizeToolbar');

    const fmt = n => Number.isInteger(n) ? n.toFixed(1) : String(n);

    function parseSizes(raw) {
        const list = [];
        const regex = /([\d.]+)\s*[x×]\s*([\d.]+)/gi;
        let m;
        while ((m = regex.exec(raw || '')) !== null) {
            const d = parseFloat(m[1]);
            const l = parseFloat(m[2]);
            if (!list.some(s => s.d === d && s.l === l)) list.push({ d, l });
        }
        return list;
    }

    let sizeList = parseSizes(hiddenSizes.value);

    function render() {
        sizeList.sort((a, b) => a.d - b.d || a.l - b.l);
        hiddenSizes.value = sizeList.map(s => `Ø ${fmt(s.d)} x ${fmt(s.l)} mm`).join(', ');

        sizeChips.innerHTML = '';
        sizeToolbar.hidden = sizeList.length === 0;
        chipCount.textContent = `${sizeList.length} sizes`;

        sizeList.forEach((s, index) => {
            const chip = document.createElement('span');
            chip.className = 'size-chip';
            chip.textContent = `Ø ${fmt(s.d)} × ${fmt(s.l)} mm`;

            const remove = document.createElement('button');
            remove.type = 'button';
            remove.className = 'chip-remove';
            remove.textContent = '×';
            remove.title = 'Remove size';
            remove.addEventListener('click', () => {
                sizeList.splice(index, 1);
                render();
            });

            chip.appendChild(remove);
            sizeChips.appendChild(chip);
        });
    }

    function addSizes() {
        const d = parseFloat(diameterInput.value);
        const lengths = lengthsInput.value
            .split(/[,\s]+/)
            .map(v => parseFloat(v))
            .filter(v => !isNaN(v) && v > 0);

        if (isNaN(d) || d <= 0 || lengths.length === 0) {
            sizeError.hidden = false;
            return;
        }

        sizeError.hidden = true;
        lengths.forEach(l => {
            if (!sizeList.some(s => s.d === d && s.l === l)) sizeList.push({ d, l });
        });

        lengthsInput.value = '';
        lengthsInput.focus();
        render();
    }

    addSizeButton.addEventListener('click', addSizes);

    [diameterInput, lengthsInput].forEach(input => {
        input.addEventListener('keydown', e => {
            if (e.key === 'Enter') {
                e.preventDefault();
                addSizes();
            }
        });
    });

    clearAllButton.addEventListener('click', () => {
        if (confirm('Are you sure you want to remove all sizes?')) {
            sizeList = [];
            render();
        }
    });

    render();
})();