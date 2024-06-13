function getFieldError(el) {
    const validity = el.validity;
  
    if (validity.valid) return true;
    if (validity.valueMissing) return "Wypełnij pole";
    if (validity.patternMismatch) return "Wpisana wartość nie spełnia wymagań";
    return "Wypełnij poprawnie pole";
  }
  
  function removeFieldError(field) {
    const errorField = field.nextElementSibling;
    if (errorField !== null) {
      if (errorField.classList.contains("form-error-text")) {
        errorField.remove();
      }
    }
  }
  
  function createFieldError(field, text) {
    removeFieldError(field);
  
    const div = document.createElement("div");
    div.classList.add("form-error-text");
    if (field.type === "checkbox") {
      text = "Wymagane";
      div.innerText = text;
      field.parentElement.appendChild(div);
    } else {
      div.innerText = text;
      field.insertAdjacentElement("afterend", div);
    }
  }
  const forms = document.querySelector("form")
  const inputs = document.querySelectorAll("input");
  const textarea = document.querySelector("textarea")
  let fields = [];
  inputs.forEach((field)=>{
    fields.push(field)
  })
  fields.push(textarea)
  forms.setAttribute("novalidate", true);
  
  for (const el of fields) {
    el.addEventListener("click", (e) => {
      removeFieldError(e.target);
      el.classList.remove("field-error")
    });
  }
  forms.addEventListener("submit", (e) => {
    e.preventDefault();
  
    let formHasErrors = false;
    for (const el of fields) {
      removeFieldError(el);
      el.classList.remove("field-error");
  
      if (!el.checkValidity()) {
        createFieldError(el, getFieldError(el));
        el.classList.add("field-error");
        formHasErrors = true;
      }
    }
    if (!formHasErrors) {
      e.target.submit();
    }
  });