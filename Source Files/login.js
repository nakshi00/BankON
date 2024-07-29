	/**
 * Validates the email and password input fields.
 * @returns {boolean} Returns true if validation is successful, otherwise false.
 */
function validated() {
  var email = document.forms['form']['email'];
  var password = document.forms['form']['password'];
  var email_error = document.getElementById('email_error');
  var pass_error = document.getElementById('pass_error');

  email.addEventListener('textInput', email_Verify);
  password.addEventListener('textInput', pass_Verify);

  if (email.value.length < 9 || password.value.length < 6) {
      // Validation failed, display errors if needed
      if (email.value.length < 9) {
          email.style.border = "1px solid red";
          email_error.style.display = "block";
          email.focus();
      }
      if (password.value.length < 6) {
          password.style.border = "1px solid red";
          pass_error.style.display = "block";
          password.focus();
      }
      return false;
  }

  // Validation successful, navigate to the homepage
  window.location.href = "homepage.html";
  return true;
}

/**
* Verifies the email input field's content.
* @returns {boolean} Returns true if the email input is valid, otherwise false.
*/
function email_Verify() {
  if (email.value.length >= 8) {
      email.style.border = "1px solid silver";
      email_error.style.display = "none";
      return true;
  }
}

/**
* Verifies the password input field's content.
* @returns {boolean} Returns true if the password input is valid, otherwise false.
*/
function pass_Verify() {
  if (password.value.length >= 5) {
      password.style.border = "1px solid silver";
      pass_error.style.display = "none";
      return true;
  }
}
