// Function to display error message as an alert
function displayErrorMessage(message) {
    alert(message); // Display error message in an alert box
}

// Function to check for error parameter and display error message on page load
window.addEventListener('DOMContentLoaded', (event) => {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('error')) {
        displayErrorMessage('Invalid username or password.'); // Display error message
    }
});

// Function to toggle password visibility
function togglePassword() {
    var passwordInput = document.getElementById("password");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
}

// Function to display registration error message if error parameter exists in URL
function displayRegistrationError() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('registrationError')) {
        const errorMessage = urlParams.get('message') || 'An error occurred during registration.';
        displayErrorMessage(errorMessage); // Display registration error message
    }
}

// Attach event listener to DOMContentLoaded event to trigger error message display
window.addEventListener('DOMContentLoaded', () => {
    displayRegistrationError(); // Display registration error message if exists
});
