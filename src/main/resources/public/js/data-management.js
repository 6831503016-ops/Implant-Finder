/* ==========================================================
   Data Management
   จัดการการทำงานเพิ่มเติมในหน้า Implant Data Management
========================================================== */

// 1. จัดการ Size Dropdown
document.addEventListener('click', event => {

    const openDropdowns = document.querySelectorAll('.size-dropdown[open]');

    openDropdowns.forEach(dropdown => {
        // ปิด Dropdown เมื่อคลิกด้านนอก
        if (!dropdown.contains(event.target)) {
            dropdown.removeAttribute('open');
        }
    });
});


// 2. จัดการรูปภาพที่โหลดไม่สำเร็จ
document.querySelectorAll('.dm-thumb img').forEach(image => {
    image.addEventListener('error', () => {
        // ซ่อนรูปภาพเมื่อไม่สามารถโหลดได้
        image.style.visibility = 'hidden';
    });
});


// 3. ยืนยันก่อนลบโมเดล
const deleteDialog = document.getElementById('deleteModelDialog');
const confirmDeleteButton = document.getElementById('confirmDeleteModel');
let pendingDeleteForm = null;

if (deleteDialog && confirmDeleteButton) {

    // ✅ แก้: ปุ่มใน HTML ใช้ class "icon-delete" (เดิมเขียนผิดเป็น ".icon-btn-delete")
    document.querySelectorAll('.icon-delete').forEach(button => {
        button.addEventListener('click', () => {
            pendingDeleteForm = button.closest('form');
            if (pendingDeleteForm) {
                deleteDialog.showModal();
            }
        });
    });

    deleteDialog.querySelector('.dm-delete-cancel').addEventListener('click', () => {
        deleteDialog.close();
    });

    confirmDeleteButton.addEventListener('click', () => {
        if (!pendingDeleteForm) return;

        const form = pendingDeleteForm;
        pendingDeleteForm = null;
        deleteDialog.close();
        form.submit();   // ส่ง POST ไป /admin/delete/{id}
    });

    // คลิกพื้นหลังมืด = ปิดป๊อปอัป
    deleteDialog.addEventListener('click', event => {
        if (event.target === deleteDialog) {
            deleteDialog.close();
        }
    });

    deleteDialog.addEventListener('close', () => {
        pendingDeleteForm = null;
    });
}

// 4. คืนสถานะหน้าหลังเปลี่ยนสถานะโมเดล
const modelStatusForms = document.querySelectorAll(
    'form[action*="/admin/toggle-status/"]'
);
const managementStateKey = 'data-management-toggle-state';

modelStatusForms.forEach(form => {
    form.addEventListener('submit', () => {
        const pageButton = document.querySelector(
            '#pageNumbers [aria-current="page"]'
        );
        const dropdowns = Array.from(
            document.querySelectorAll('.size-dropdown')
        );

        try {
            sessionStorage.setItem(managementStateKey, JSON.stringify({
                page: Number(pageButton?.textContent) || 1,
                scrollY: window.scrollY,
                search: document.getElementById('searchInput')?.value || '',
                openDropdowns: dropdowns.flatMap((dropdown, index) =>
                    dropdown.open ? [index] : []
                )
            }));
        } catch (error) {
            console.error('Unable to save data-management state.', error);
        }
    });
});

const pendingModelStatusForms = new WeakSet();

modelStatusForms.forEach(form => {
    form.addEventListener('submit', async event => {
        event.preventDefault();

        if (pendingModelStatusForms.has(form)) {
            return;
        }

        const modelButton = form.querySelector('button[type="submit"]');
        const modelRow = form.closest('.model-row');

        if (!modelButton || !modelRow) {
            console.error('Unable to find the model toggle or its table row.');
            return;
        }

        pendingModelStatusForms.add(form);

        try {
            try {
                sessionStorage.removeItem(managementStateKey);
            } catch (error) {
                console.error('Unable to clear saved data-management state.', error);
            }

            const response = await fetch(form.action, {
                method: form.method,
                body: new URLSearchParams(new FormData(form)),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
                },
                credentials: 'same-origin'
            });

            const responseUrl = new URL(response.url, window.location.href);
            if (
                !response.ok ||
                (response.redirected &&
                    !responseUrl.pathname.endsWith('/admin/data-management'))
            ) {
                throw new Error(`Model status request failed (${response.status}).`);
            }

            const hidden = !modelButton.classList.contains('is-off');
            modelButton.classList.toggle('is-off', hidden);
            modelButton.title = hidden
                ? 'Hidden (click to show)'
                : 'Visible (click to hide)';
            modelButton.setAttribute(
                'aria-label',
                hidden ? 'Show model' : 'Hide model'
            );

            modelRow.querySelectorAll('.size-list li').forEach(item => {
                const sizeButton = item.querySelector('.switch-sm');
                const sizeLabel = item.querySelector('span');

                if (sizeButton) {
                    sizeButton.classList.toggle('is-off', hidden);
                    sizeButton.title = hidden
                        ? 'Hidden (click to show)'
                        : 'Visible (click to hide)';
                    sizeButton.setAttribute(
                        'aria-label',
                        hidden ? 'Show size' : 'Hide size'
                    );
                }

                sizeLabel?.classList.toggle('is-hidden', hidden);
            });
        } catch (error) {
            console.error('Unable to update model status.', error);
        } finally {
            pendingModelStatusForms.delete(form);
        }
    });
});

const savedManagementState = sessionStorage.getItem(managementStateKey);

if (savedManagementState) {
    try {
        const state = JSON.parse(savedManagementState);
        const searchInput = document.getElementById('searchInput');

        if (searchInput && typeof state.search === 'string') {
            searchInput.value = state.search;
            searchInput.dispatchEvent(new Event('input', { bubbles: true }));
        }

        const pageButtons = Array.from(
            document.querySelectorAll('#pageNumbers .page-number')
        );
        const savedPage = Number.isInteger(state.page) && state.page > 0
            ? state.page
            : 1;
        const pageToRestore = Math.min(savedPage, pageButtons.length || 1);

        pageButtons[pageToRestore - 1]?.click();

        const dropdowns = document.querySelectorAll('.size-dropdown');
        if (Array.isArray(state.openDropdowns)) {
            state.openDropdowns.forEach(index => {
                if (Number.isInteger(index) && dropdowns[index]) {
                    dropdowns[index].open = true;
                }
            });
        }

        if (Number.isFinite(state.scrollY)) {
            window.scrollTo(0, state.scrollY);
        }
    } catch (error) {
        console.error('Unable to restore data-management state.', error);
    } finally {
        sessionStorage.removeItem(managementStateKey);
    }
}