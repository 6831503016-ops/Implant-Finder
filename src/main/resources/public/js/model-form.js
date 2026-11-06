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
    const dropZone = document.getElementById('dropZone');
    const fileInput = document.getElementById('imageFile');
    const removeBtn = document.getElementById('removeImageBtn');
    const fileError = document.getElementById('imageFileError');

    const ALLOWED_TYPES = ['image/png', 'image/jpeg', 'image/webp'];
    const MAX_SIZE = 5 * 1024 * 1024; // 5MB
    let objectUrl = null;

    // จำรูปเดิมตอนโหลดหน้า (หน้า Add จะเป็นค่าว่าง, หน้า Edit จะเป็นรูปปัจจุบัน)
    const originalSrc = (preview && !preview.hidden) ? (preview.getAttribute('src') || '') : '';
    const originalUrlValue = imageUrlInput ? imageUrlInput.value : '';

    function showPreview(url) {
        if (!preview) return;
        if (url) {
            preview.src = url;
            preview.hidden = false;
            if (placeholder) placeholder.hidden = true;
        } else {
            preview.removeAttribute('src');
            preview.hidden = true;
            if (placeholder) placeholder.hidden = false;
        }
        // ปุ่ม ✕ แสดงเฉพาะตอนที่มีการเปลี่ยนรูปจากของเดิม
        if (removeBtn) removeBtn.hidden = !url || url === originalSrc;
    }

    function releaseObjectUrl() {
        if (objectUrl) {
            URL.revokeObjectURL(objectUrl);
            objectUrl = null;
        }
    }

    function setFileError(msg) {
        if (!fileError) return;
        fileError.textContent = msg || '';
        fileError.hidden = !msg;
    }

    if (preview) {
        preview.addEventListener('error', () => showPreview(''));
    }

    if (imageUrlInput) {
        imageUrlInput.addEventListener('input', () => {
            const url = imageUrlInput.value.trim();
            if (url && fileInput) {          // พิมพ์ URL = เลิกใช้ไฟล์ที่เลือกไว้
                fileInput.value = '';
                releaseObjectUrl();
                setFileError('');
            }
            showPreview(url);
        });
    }

    if (dropZone && fileInput) {
        function handleFile(file) {
            if (!file) return;
            if (!ALLOWED_TYPES.includes(file.type)) {
                setFileError('Please choose a PNG, JPG or WEBP image.');
                return;
            }
            if (file.size > MAX_SIZE) {
                setFileError('Image must be 5 MB or smaller.');
                return;
            }
            setFileError('');
            releaseObjectUrl();
            objectUrl = URL.createObjectURL(file);
            if (imageUrlInput) imageUrlInput.value = '';   // ใช้ไฟล์แทน URL
            showPreview(objectUrl);
        }

        dropZone.addEventListener('click', e => {
            if (e.target !== removeBtn) fileInput.click();
        });
        dropZone.addEventListener('keydown', e => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                fileInput.click();
            }
        });
        fileInput.addEventListener('change', () => handleFile(fileInput.files[0]));

        ['dragenter', 'dragover'].forEach(evt =>
            dropZone.addEventListener(evt, e => {
                e.preventDefault();
                dropZone.classList.add('is-dragover');
            }));
        ['dragleave', 'drop'].forEach(evt =>
            dropZone.addEventListener(evt, e => {
                e.preventDefault();
                dropZone.classList.remove('is-dragover');
            }));
        dropZone.addEventListener('drop', e => {
            const file = e.dataTransfer.files[0];
            if (!file) return;
            const dt = new DataTransfer();          // ให้ฟอร์มส่งไฟล์นี้ไปด้วย
            dt.items.add(file);
            fileInput.files = dt.files;
            handleFile(file);
        });

        // กันเบราว์เซอร์เปิดรูปทั้งหน้า ถ้าปล่อยไฟล์พลาดนอกกรอบ
        ['dragover', 'drop'].forEach(evt =>
            window.addEventListener(evt, e => e.preventDefault()));

        // ปุ่ม ✕ = ยกเลิกการเปลี่ยนรูป กลับไปเป็นรูปเดิม (หน้า Add = ล้างว่าง)
        if (removeBtn) {
            removeBtn.addEventListener('click', e => {
                e.stopPropagation();
                fileInput.value = '';
                releaseObjectUrl();
                setFileError('');
                if (imageUrlInput) imageUrlInput.value = originalUrlValue;
                showPreview(originalSrc);
            });
        }
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