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