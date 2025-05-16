function validateForm() {
    return validateFields();
}

function validateFields() {
    const title = document.plantForm.pla_title.value.trim();
    const contents = document.plantForm.pla_contents.value.trim();

    if (title === "") {
        alert("제목을 입력하세요!");
        document.plantForm.pla_title.focus();
        return false;
    }

    if (contents === "") {
        alert("내용을 입력하세요!");
        document.plantForm.pla_contents.focus();
        return false;
    }

    return true;
}
