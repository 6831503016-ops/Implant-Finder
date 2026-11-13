
/* ==========================================================
   Admin Preview Home
   จัดการสถานะ Admin Preview ในหน้า Homepage
========================================================== */
(function () {

    const returnEntryKey = 'adminPreviewReturnEntryKey';
    const backButton = document.getElementById('backToAdmin');

    function isAdminDataManagementUrl(value) {
        if (!value) return false;

        const url = new URL(value, window.location.href);
        const adminUrl = new URL(backButton.href, window.location.href);
        return url.origin === adminUrl.origin &&
            url.pathname === adminUrl.pathname;
    }

    try {
        sessionStorage.setItem('adminPreview', '1');

        const navigation = window.navigation;

        if (!navigation || typeof navigation.entries !== 'function') return;

        const entries = navigation.entries();
        const savedKey = sessionStorage.getItem(returnEntryKey);
        const savedEntry = savedKey && entries.find(entry => entry.key === savedKey);

        if (savedEntry && isAdminDataManagementUrl(savedEntry.url)) return;

        if (savedKey) sessionStorage.removeItem(returnEntryKey);

        const currentEntry = navigation.currentEntry;
        const previousEntry = currentEntry && entries
            .find(entry => entry.index === currentEntry.index - 1);

        if (previousEntry?.key && isAdminDataManagementUrl(previousEntry.url)) {
            sessionStorage.setItem(returnEntryKey, previousEntry.key);
        }
    } catch (error) {
        console.warn('Unable to save the Admin Preview return history entry.', error);
    }

})();