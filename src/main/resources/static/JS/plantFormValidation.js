function validateForm() {
    return validateFields();  // 유효성 검사를 하고 그 결과를 반환
}

function validateFields() {
    const form = document.forms['plantForm'];  // form 요소 접근
    const title = form['pla_title'].value.trim();  // 제목 필드 값
    const contents = form['pla_contents'].value.trim();  // 내용 필드 값

    if (title === "") {
        alert("제목을 입력해 주세요");  // 제목이 비어있으면 경고
        form['pla_title'].focus();  // 제목 필드로 포커스 이동
        return false;  // 폼 제출을 막음
    }

    if (contents === "") {
        alert("내용을 입력해 주세요");  // 내용이 비어있으면 경고
        form['pla_contents'].focus();  // 내용 필드로 포커스 이동
        return false;  // 폼 제출을 막음
    }

    return true;  // 유효성 검사 통과하면 폼 제출 허용
}
