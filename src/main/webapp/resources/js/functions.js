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

function progressStudent() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idStud]:checked')
    if (checkedCheckboxs.length == 0) {
        alert("Выберете одного студента!!!");
        return;
    }

    if (checkedCheckboxs.length > 1) {
        alert("Выберете только одного студента!!!");
        return;
    }

    document.getElementById("hiddenProgress").value = checkedCheckboxs[0].value;
    document.getElementById('formProgress').submit();
}

function deleteDisciplines() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idDiscip]:checked')
    if (checkedCheckboxs.length == 0) {
        alert("Выберете хотя бы одну дисциплину!!!");
        return;
    }
    var ids = ""
    for (var i=0;i<checkedCheckboxs.length;i++){
        ids = ids  + checkedCheckboxs[i].value + " ";
    }

    document.getElementById("hiddenDeleteDiscipline").value = ids;
    document.getElementById('formDeleteDiscipline').submit();
}

function modifyDiscipline() {
    var checkedCheckboxs = document.querySelectorAll('input[name=idDiscip]:checked')
    if (checkedCheckboxs.length == 0) {
        alert("Выберете одну дисциплину!!!");
        return;
    }

    if (checkedCheckboxs.length > 1) {
        alert("Выберете только одну дисциплину!!!");
        return;
    }

    document.getElementById("hiddenModifyDiscipline").value = checkedCheckboxs[0].value;
    document.getElementById('formModifyDiscipline').submit();
}

