
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

    document.querySelectorAll('.icon-delete').forEach(button => {

        button.addEventListener('click', () => {

            pendingDeleteForm = button.closest('form');

            if (pendingDeleteForm) {
                deleteDialog.showModal();
            }

        });

    });


    deleteDialog.querySelector('.dm-delete-cancel')?.addEventListener('click', () => {

        deleteDialog.close();

    });


    confirmDeleteButton.addEventListener('click', () => {

        if (!pendingDeleteForm) return;

        const form = pendingDeleteForm;

        pendingDeleteForm = null;

        deleteDialog.close();

        form.submit();

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



// 4. บันทึกและคืนสถานะหน้า Data Management

const managementStateKey = 'data-management-toggle-state';

const modelStatusForms = document.querySelectorAll(
    'form[action*="/admin/toggle-status/"]'
);

const sizeStatusForms = document.querySelectorAll(
    'form[action*="/admin/toggle-size-status/"]'
);


// บันทึกสถานะปัจจุบันก่อนส่งฟอร์ม
function saveManagementState() {

    const pageButton = document.querySelector(
        '#pageNumbers [aria-current="page"]'
    );

    const dropdowns = Array.from(
        document.querySelectorAll('.size-dropdown')
    );

    const state = {

        page: Number(pageButton?.textContent) || 1,

        scrollY: window.scrollY,

        search: document.getElementById('searchInput')?.value || '',

        openDropdowns: dropdowns.flatMap((dropdown, index) =>
            dropdown.open ? [index] : []
        )

    };


    try {

        sessionStorage.setItem(
            managementStateKey,
            JSON.stringify(state)
        );

    } catch (error) {

        console.error('Unable to save data-management state.', error);

    }

}

// Save management state before entering Admin Preview
const viewAsUserButton = document.querySelector('.dm-view-btn');

if (viewAsUserButton) {

    viewAsUserButton.addEventListener('click', () => {

        saveManagementState();

    });

}



// 5. Model-level AJAX toggle

const pendingModelStatusForms = new WeakSet();

modelStatusForms.forEach(form => {

    form.addEventListener('submit', saveManagementState);


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

            // Model toggle uses AJAX, so no page restoration is needed.
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
                (
                    response.redirected &&
                    !responseUrl.pathname.endsWith('/admin/data-management')
                )
            ) {

                throw new Error(
                    `Model status request failed (${response.status}).`
                );

            }


            // Update model toggle appearance
            const hidden = !modelButton.classList.contains('is-off');

            modelButton.classList.toggle('is-off', hidden);

            modelButton.title = hidden
                ? 'Hidden (click to show)'
                : 'Visible (click to hide)';

            modelButton.setAttribute(
                'aria-label',
                hidden ? 'Show model' : 'Hide model'
            );


            // Update all size toggles and labels inside this model
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

            console.error('Unable to update model status:', error);


        } finally {

            pendingModelStatusForms.delete(form);

        }

    });

});



// 6. Individual Size Toggle (AJAX)

const pendingSizeStatusForms = new WeakSet();

sizeStatusForms.forEach(form => {

    form.addEventListener('submit', async event => {

        event.preventDefault();


        if (pendingSizeStatusForms.has(form)) {
            return;
        }


        const button = form.querySelector('.switch');

        const sizeLabel = form.previousElementSibling;


        if (!button || button.disabled) {
            return;
        }


        pendingSizeStatusForms.add(form);

        button.disabled = true;


        try {

            const response = await fetch(form.action, {

                method: 'POST',

                body: new FormData(form),

                credentials: 'same-origin',

                headers: {

                    'X-Requested-With': 'XMLHttpRequest'

                }

            });


            if (!response.ok) {

                throw new Error(
                    `Could not update size status (${response.status}).`
                );

            }


            const result = await response.json();


            if (!result.success) {

                throw new Error('Size status update failed.');

            }


            // Update only the clicked size
            const isCurrentlyHidden = button.classList.contains('is-off');

            const shouldHide = !isCurrentlyHidden;


            button.classList.toggle('is-off', shouldHide);

            button.title = shouldHide
                ? 'Hidden (click to show)'
                : 'Visible (click to hide)';

            button.setAttribute(
                'aria-label',
                shouldHide ? 'Show size' : 'Hide size'
            );


            if (sizeLabel) {

                sizeLabel.classList.toggle('is-hidden', shouldHide);

            }


        } catch (error) {

            console.error('Size toggle error:', error);

            alert('Could not update the size status. Please try again.');


        } finally {

            button.disabled = false;

            pendingSizeStatusForms.delete(form);

        }

    });

});



// 7. Restore saved page state after initialization
// model-search.js is loaded before this file in the HTML.
// Its initial renderPage() has already generated the pagination buttons.

function restoreManagementState() {

    let savedManagementState;


    try {

        savedManagementState = sessionStorage.getItem(managementStateKey);

    } catch (error) {

        console.error('Unable to read saved data-management state.', error);

        return;

    }


    if (!savedManagementState) {
        return;
    }


    try {

        const state = JSON.parse(savedManagementState);


        // A. Restore search first.
        // model-search.js handles this input event synchronously.
        // B. Restore pagination after search has rendered.
        // C. Restore previously open size dropdowns.
        const dropdowns = document.querySelectorAll('.size-dropdown');


        if (Array.isArray(state.openDropdowns)) {

            state.openDropdowns.forEach(index => {

                if (
                    Number.isInteger(index) &&
                    index >= 0 &&
                    dropdowns[index]
                ) {

                    dropdowns[index].open = true;

                }

            });

        }


        // D. Restore scroll position last.
        if (
            typeof state.scrollY === 'number' &&
            Number.isFinite(state.scrollY)
        ) {

            window.scrollTo(0, state.scrollY);

        }


    } catch (error) {

        console.error('Unable to restore data-management state:', error);


    } finally {

        // Prevent stale state from being restored again.
        try {

            sessionStorage.removeItem(managementStateKey);

        } catch (error) {

            console.error('Unable to clear saved data-management state.', error);

        }

    }

}



// Restore immediately because model-search.js has already initialized
// and generated the initial pagination buttons.

restoreManagementState();
