
const brandList = document.getElementById("brandList");
const searchInput = document.getElementById("searchbrand");
const searchButton = document.getElementById("searchButton");
const message = document.getElementById("message");

//เรียงแบรนด์ตามตัวอักษร A-Z
function sortBrands() {
    const brands = Array.from(
        brandList.querySelectorAll(".brands")
    );

    brands.sort(function(a, b) {
        const nameA = a.querySelector(".name").textContent.trim();
        const nameB = b.querySelector(".name").textContent.trim();

        return nameA.localeCompare(nameB, "en", {
            sensitivity: "base"
        });
    });

    brands.forEach(function(brand) {
        brandList.appendChild(brand);
    });
}

//ค้นหาและกรองแบรนด์ทันที
function searchBrand() {
    const input = searchInput.value.trim().toLowerCase();
    const brands = brandList.querySelectorAll(".brands");
    let found = false;

    brands.forEach(function(brand) {
        const name = brand.querySelector(".name")
            .textContent.trim().toLowerCase();

        if (input === "" || name.includes(input)) {
            brand.style.display = "";
            found = true;
        } else {
            brand.style.display = "none";
        }
    });

    if (input !== "" && !found) {
        message.textContent = "Brand not found.";
    } else {
        message.textContent = "";
    }
}

//เรียงแบรนด์เมื่อเปิดหน้าเว็บ
sortBrands();

//พิมพ์แล้วค้นหาทันที
searchInput.addEventListener("input", searchBrand);

//คลิกปุ่ม Search
searchButton.addEventListener("click", searchBrand);

//Enter หรือปุ่มค้นหาบนคีย์บอร์ดโทรศัพท์
searchInput.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        event.preventDefault();
        searchBrand();
        searchInput.blur();
    }
});
