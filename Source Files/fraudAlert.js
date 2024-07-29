/**
 * Get the verification message element.
 * @type {HTMLElement}
 */
const verificationMessage = document.querySelector('#verification-message');

// Submit the form when the user clicks the submit button.
const form = document.querySelector('form');

/**
 * Event listener for the form submission.
 * @param {Event} event - The submit event.
 */
form.addEventListener('submit', function(event) {
  event.preventDefault();

  // Get the user's name and bank account number.
  const name = form.querySelector('input[name="name"]').value;
  const bankAccountNumber = form.querySelector('input[name="bank_account_number"]').value;

  // Send a request to the server to verify the bank account.
  fetch('/verify-bank-account', {
    method: 'post',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ name, bankAccountNumber }),
  })
  .then(response => response.json())
  .then(data => {
    // Display the verification message.
    verificationMessage.innerHTML = data.message;
  })
  .catch(error => {
    // Display an error message.
    verificationMessage.innerHTML = 'An error occurred while verifying your bank account.';
  });
});
