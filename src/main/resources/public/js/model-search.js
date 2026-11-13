
/* ==========================================================
   Model Search & Pagination
   ค้นหาโมเดลและแบ่งหน้าในหน้า Implant Data Management
========================================================== */

(function () {

    // ==========================================================
    // 1. ADMIN DATA MANAGEMENT SEARCH & PAGINATION
    // ==========================================================

    const searchInput = document.getElementById('searchInput');
    const rows = Array.from(document.querySelectorAll('.model-row'));

    const pageNumbers = document.getElementById('pageNumbers');
    const previousPage = document.getElementById('previousPage');
    const nextPage = document.getElementById('nextPage');
    const noResults = document.getElementById('noResults');

    // จำนวนรายการต่อหน้า
    const pageSize = 6;

    // Retrieve saved management state before initial rendering
    const managementStateKey = 'data-management-toggle-state';

    let savedManagementState = null;

    try {
        const savedState = sessionStorage.getItem(managementStateKey);

        if (savedState) {
            savedManagementState = JSON.parse(savedState);
        }
    } catch (error) {
        console.error('Unable to retrieve management state.', error);
    }

    let currentPage = 1;
    let filteredRows = rows;

    // แสดงรายการตามหน้าปัจจุบัน
    function renderPage() {

        const pageCount = Math.max(
            1,
            Math.ceil(filteredRows.length / pageSize)
        );

        // ป้องกันเลขหน้าเกินจำนวนหน้าที่มี
        currentPage = Math.min(
            Math.max(currentPage, 1),
            pageCount
        );

        // ซ่อนรายการทั้งหมดก่อน
        rows.forEach(row => {
            row.style.display = 'none';
        });

        // คำนวณตำแหน่งรายการที่แสดง
        const start = (currentPage - 1) * pageSize;

        const currentRows = filteredRows.slice(
            start,
            start + pageSize
        );

        // แสดงรายการเฉพาะหน้าปัจจุบัน
        currentRows.forEach(row => {
            row.style.display = '';
        });

        // แสดงข้อความเมื่อไม่พบข้อมูล
        noResults.hidden = filteredRows.length > 0;

        // แสดงเลขหน้า
        const numberButtons = Array.from(
            { length: pageCount },
            (_, index) => {

                const page = index + 1;
                const button = document.createElement('button');

                button.type = 'button';
                button.className = 'page-number';
                button.textContent = page;
                button.setAttribute('aria-label', `Page ${page}`);

                if (page === currentPage) {
                    button.setAttribute('aria-current', 'page');
                }

                button.addEventListener('click', () => {

                    if (page !== currentPage) {

                        currentPage = page;
                        renderPage();

                        pageNumbers
                            .querySelector('[aria-current="page"]')
                            ?.focus({ preventScroll: true });
                    }
                });

                return button;
            }
        );

        pageNumbers.replaceChildren(
            ...(filteredRows.length ? numberButtons : [])
        );

        // ปิดปุ่ม Previous เมื่ออยู่หน้าแรก
        previousPage.disabled = currentPage <= 1;

        // ปิดปุ่ม Next เมื่ออยู่หน้าสุดท้าย
        nextPage.disabled = currentPage >= pageCount;
    }

    // ค้นหาโมเดลจากชื่อ Brand หรือ Model
    function filterModels() {

        const query = searchInput.value
            .toLowerCase()
            .trim();

        filteredRows = rows.filter(row => {

            const brand = row.querySelector('.brand-cell')
                ?.textContent.toLowerCase().trim() || '';

            const model = row.querySelector('.model-cell')
                ?.textContent.toLowerCase().trim() || '';

            // ค้นหาจากส่วนใดก็ได้ของชื่อ Brand หรือ Model
            return brand.startsWith(query) ||
                   model.startsWith(query);
        });

        // กลับไปหน้าแรกเมื่อค้นหาใหม่
        currentPage = 1;

        renderPage();
    }

    // ตรวจสอบว่ามีองค์ประกอบของหน้า Admin หรือไม่
    if (
        searchInput &&
        rows.length > 0 &&
        pageNumbers &&
        previousPage &&
        nextPage &&
        noResults
    ) {

        // ค้นหาข้อมูลเมื่อผู้ใช้พิมพ์
        searchInput.addEventListener('input', filterModels);

        // ไปหน้าก่อนหน้า
        previousPage.addEventListener('click', () => {

            if (currentPage > 1) {
                currentPage--;
                renderPage();
            }
        });

        // ไปหน้าถัดไป
        nextPage.addEventListener('click', () => {

            const pageCount = Math.ceil(
                filteredRows.length / pageSize
            );

            if (currentPage < pageCount) {
                currentPage++;
                renderPage();
            }
        });

        // Restore saved search and pagination BEFORE initial rendering
        if (savedManagementState) {

            // 1. Restore search without triggering another render
            if (typeof savedManagementState.search === 'string') {

                searchInput.value = savedManagementState.search;

                const query = searchInput.value
                    .toLowerCase()
                    .trim();

                filteredRows = rows.filter(row => {

                    const brand = row.querySelector('.brand-cell')
                        ?.textContent.toLowerCase().trim() || '';

                    const model = row.querySelector('.model-cell')
                        ?.textContent.toLowerCase().trim() || '';

                    return brand.startsWith(query) ||
                           model.startsWith(query);
                });
            }

            // 2. Restore previous page
            if (
                Number.isInteger(savedManagementState.page) &&
                savedManagementState.page > 0
            ) {

                currentPage = savedManagementState.page;

            }
        }

        // Render once, directly on the restored page
        renderPage();
    }


    // ==========================================================
    // 2. BRAND MODELS SEARCH
    // ==========================================================

    // ดึงช่องค้นหาและข้อความแจ้งเตือน
    const brandSearchInput = document.getElementById('searchModels');
    const modelCards = Array.from(
        document.querySelectorAll('.model-card')
    );

    const noModels = document.getElementById('noModels');

    // ตรวจสอบว่ามีองค์ประกอบของหน้า Brand Models หรือไม่
    if (
        brandSearchInput &&
        modelCards.length > 0
    ) {

        // ค้นหาเมื่อผู้ใช้พิมพ์ข้อความ
        brandSearchInput.addEventListener('input', function () {

            const query = brandSearchInput.value
                .toLowerCase()
                .trim();

            let shown = 0;

            // ตรวจสอบการ์ดโมเดลทั้งหมด
            modelCards.forEach(card => {

                // อ่านชื่อโมเดลจาก model-title เท่านั้น
                const modelName = (
                    card.querySelector('.model-title')?.textContent || ''
                ).toLowerCase().trim();

                // ตรวจสอบว่าชื่อโมเดลขึ้นต้นด้วยข้อความค้นหาหรือไม่
                const matches = modelName.startsWith(query);

                // แสดงหรือซ่อนการ์ด
                card.style.display = matches ? '' : 'none';

                if (matches) {
                    shown++;
                }
            });

            // แสดงข้อความเมื่อไม่พบโมเดล
            if (noModels) {
                noModels.classList.toggle('hidden', shown > 0);
                noModels.hidden = shown > 0;
            }

        });

    }

})();
