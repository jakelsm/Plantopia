function validateClinicForm() {
    const form = document.forms["clinicForm"];
    const titleInput = form["plc_title"];
    const contentsInput = form["plc_contents"];

    if (!titleInput.value.trim()) {
        alert("제목을 입력해 주세요.");
        titleInput.focus();
        return false;
    }

    if (!contentsInput.value.trim()) {
        alert("본문을 입력해 주세요.");
        contentsInput.focus();
        return false;
    }

    return true;
}

window.onload = function () {
    const form = document.forms["clinicForm"];
    form.onsubmit = function (e) {
        if (!validateClinicForm()) {
            e.preventDefault();
        }
    };
};

function resetClinicForm() {
    const form = document.forms["clinicForm"];
    if (form) {
        // 모든 입력 필드 초기화
        form["plc_title"].value = "";
        form["growing_loc"].value = "";
        form["growth_con"].value = "";
        form["watering"].value = "";
        form["last_rep"].value = "";
        form["last_fert"].value = "";
        form["last_pruned"].value = "";
        form["plant_pos"].value = "";
        form["pest_dmg"].value = "";
        form["discolored"].value = "";
        form["plc_contents"].value = "";
    }
}

