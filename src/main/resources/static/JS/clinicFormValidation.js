window.onload = function () {
    const form = document.forms["clinicForm"];
    const titleInput = form["plc_title"];
    const contentsInput = form["plc_contents"];

    form.onsubmit = function (e) {
        if (!titleInput.value.trim()) {
            alert("제목을 입력해 주세요.");
            titleInput.focus();
            e.preventDefault();
            return;
        }

        if (!contentsInput.value.trim()) {
            alert("본문을 입력해 주세요.");
            contentsInput.focus();
            e.preventDefault();
            return;
        }
    };
};
