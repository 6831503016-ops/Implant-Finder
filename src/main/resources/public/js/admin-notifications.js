
document.addEventListener("DOMContentLoaded", function () {

    const notification = document.querySelector(".admin-notification");

    if (!notification) return;

    const closeButton = notification.querySelector(
        ".admin-notification-close"
    );

    let timeout;

    function hideNotification() {

        if (notification.classList.contains("is-hiding")) return;

        notification.classList.add("is-hiding");

        setTimeout(function () {

            const region = notification.closest(
                ".admin-notification-region"
            );

            if (region) {
                region.remove();
            }

        }, 250);
    }

    // Automatically disappear after 3 seconds
    timeout = setTimeout(hideNotification, 3000);

    // Close manually
    if (closeButton) {

        closeButton.addEventListener("click", function () {

            clearTimeout(timeout);

            hideNotification();

        });

    }

});
