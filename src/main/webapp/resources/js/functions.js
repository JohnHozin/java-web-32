function deleteStudents() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked')
    if (checkedCheckboxs.length == 0) {
        alert("Выберете хотя бы одного студента!!!");
        return;
    }

    // 1-2-5-7  -  string
    var ids = ""
    for (var i=0;i<checkedCheckboxs.length;i++){
        ids = ids  + checkedCheckboxs[i].value + " ";
    }

    document.getElementById("hiddenDelete").value = ids;
    document.getElementById('formDelete').submit();
}

function modifyStudent() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked')
    if (checkedCheckboxs.length == 0) {
        alert("Выберете одного студента!!!");
        return;
    }

    if (checkedCheckboxs.length > 1) {
        alert("Выберете только одного студента!!!");
        return;
    }

    document.getElementById("hiddenModify").value = checkedCheckboxs[0].value;
    document.getElementById('formModify').submit();
}