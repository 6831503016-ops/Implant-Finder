
/* ==========================================================
   Back to Admin (.back-to-admin)
   แสดงปุ่มกลับไปหน้า Admin เมื่อเปิด User Preview
========================================================== */
(function () {

    // 1) ตรวจสอบสถานะ Admin Preview จาก sessionStorage
    try {
        if (sessionStorage.getItem('adminPreview') === '1') {

            // 2) ดึงปุ่ม Back to Admin จาก HTML
            const btn = document.getElementById('backToAdmin');

            // 3) แสดงปุ่ม Back to Admin
            if (btn) {
                btn.classList.add('is-visible');
            }
        }
    } catch (e) {
        // ไม่ทำอะไรหากไม่สามารถเข้าถึง sessionStorage ได้
    }
})();


/* ==========================================================
   Back to Admin (.back-to-admin)
   แสดงปุ่มกลับไปหน้า Admin เมื่อเปิด User Preview
========================================================== */
(function () {

    // 1) ตรวจสอบสถานะ Admin Preview จาก sessionStorage
    try {
        if (sessionStorage.getItem('adminPreview') === '1') {

            // 2) ดึงปุ่ม Back to Admin จาก HTML
            const btn = document.getElementById('backToAdmin');

            // 3) แสดงปุ่ม Back to Admin
            if (btn) {
                btn.classList.add('is-visible');
            }
        }
    } catch (e) {
        // ป้องกันข้อผิดพลาดในการเข้าถึง sessionStorage
    }

})();

(function () {

    const returnEntryKey = 'adminPreviewReturnEntryKey';
    const btn = document.getElementById('backToAdmin');

    if (!btn) return;

    function isAdminDataManagementUrl(value) {
        if (!value) return false;

        try {
            const url = new URL(value, window.location.href);
            const adminUrl = new URL(btn.href, window.location.href);
            return url.origin === adminUrl.origin &&
                url.pathname === adminUrl.pathname;
        } catch (error) {
            return false;
        }
    }

    btn.addEventListener('click', event => {
        if (
            event.button !== 0 ||
            event.metaKey ||
            event.ctrlKey ||
            event.shiftKey ||
            event.altKey ||
            (btn.target && btn.target !== '_self')
        ) {
            return;
        }

        let savedReturnEntryKey = null;
        let savedReturnEntryIsAvailable = false;

        try {
            savedReturnEntryKey = sessionStorage.getItem(returnEntryKey);
        } catch (error) {
            console.warn('Unable to read the Admin Preview navigation state.', error);
        }

        const navigation = window.navigation;
        try {
            const returnEntry = savedReturnEntryKey &&
                navigation &&
                typeof navigation.entries === 'function' &&
                navigation.entries().find(entry => entry.key === savedReturnEntryKey);
            savedReturnEntryIsAvailable = !!returnEntry &&
                isAdminDataManagementUrl(returnEntry.url);
        } catch (error) {
            console.warn('Unable to inspect the Admin Preview history entries.', error);
        }

        if (
            savedReturnEntryIsAvailable &&
            navigation &&
            typeof navigation.traverseTo === 'function'
        ) {
            event.preventDefault();

            try {
                sessionStorage.removeItem(returnEntryKey);
                sessionStorage.removeItem('adminPreview');
                navigation.traverseTo(savedReturnEntryKey).committed.catch(error => {
                    console.warn('Unable to return to the original Admin history entry.', error);
                    window.location.assign(btn.href);
                });
            } catch (error) {
                console.warn('Unable to return to the original Admin history entry.', error);
                window.location.assign(btn.href);
            }

            return;
        }

        try {
            sessionStorage.removeItem(returnEntryKey);
            sessionStorage.removeItem('adminPreview');
        } catch (error) {
            console.warn('Unable to clear the Admin Preview navigation state.', error);
        }

        if (
            window.history.length > 1 &&
            isAdminDataManagementUrl(document.referrer)
        ) {
            event.preventDefault();
            window.history.back();
        }
    });

})();
