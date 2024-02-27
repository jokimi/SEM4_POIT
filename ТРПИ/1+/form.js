const form = document.getElementById('myForm');
form.addEventListener('submit', function(event) {
    event.preventDefault();
    if (validateForm()) {
        alert('Данные успешно отправлены!');
        form.reset();
    }
});
function validateForm() {
    let isValid = true;
    if (!validateField('lastName', /^[а-яА-Яa-zA-Z]{1,20}$/)) {
        isValid = false;
    }
    if (!validateField('firstName', /^[а-яА-Яa-zA-Z]{1,20}$/)) {
        isValid = false;
    }
    if (!validateField('email', /^[^\s@]+@[^\s@]+\.[^\s@]{2,5}$/)) {
        isValid = false;
    }
    if (!validateField('phone', /^\(0\d{2}\)\d{3}-\d{2}-\d{2}$/)) {
        isValid = false;
    }
    if (!validateField('about', /^.{0,250}$/)) {
        isValid = false;
    }
    if (!validateField('city', /^.{0,7}$/)) {
        isValid = false;
    }
    const cityInput = document.getElementById('city');
    if (cityInput.value !== 'Минск') {
        const confirmed = confirm('Вы указали город, отличный от Минска. Вы уверены?');
        if (!confirmed) {
            isValid = false;
        }
    }
    const studyCheckbox = document.getElementById('studyCheckbox');
    if (!studyCheckbox.checked) {
        const confirmed = confirm('Вы не указали, что учитесь в БГТУ. Вы уверены?');
        if (!confirmed) {
            isValid = false;
        }
    }
    const courseRadios = document.querySelectorAll('input[name="course"]');
    let course3Checked = false;
    for (let i = 0; i < courseRadios.length; i++) {
        if (courseRadios[i].checked && courseRadios[i].value == '3') {
            course3Checked = true;
            break;
        }
    }
    if (!course3Checked) {
        const confirmed = confirm('Вы не выбрали курс 3. Вы уверены?');
        if (!confirmed) {
            isValid = false;
        }
    }
    return isValid;
}
function validateField(fieldName, regex) {
    const field = document.getElementById(fieldName);
    const errorField = document.getElementById(fieldName + 'Error');
    const value = field.value.trim();
    if (value === '') {
        errorField.textContent = 'Поле обязательно для заполнения!';
        return false;
    }
    if (value === 'Выберите город') {
        errorField.textContent = 'Поле обязательно для заполнения!';
        return false;
    }
    if (!regex.test(value) && (fieldName == 'email' || fieldName == 'phone')) {
        errorField.textContent = 'Поле заполнено некорректно!';
        return false;
    }
    if (!regex.test(value) && (fieldName == 'firstName' || fieldName == 'lastName')) {
        errorField.textContent = 'Поле должно содержать не более 20 символов русского или английского алфавита!';
        return false;
    }
    errorField.textContent = '';
    return true;
}