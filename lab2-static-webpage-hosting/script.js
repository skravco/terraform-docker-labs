const passwordField = document.getElementById("password");
const generateBtn = document.getElementById("generateBtn");
const copyBtn = document.getElementById("copyBtn");

function generatePassword(length = 16) {
  const lowercase = "abcdefghijklmnopqrstuvwxyz";
  const uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const numbers = "0123456789";
  const special = "!@#$%^&*()_+[]{}|;:',.<>?/`~";

  const allChars = lowercase + uppercase + numbers + special;

  let password = "";
  password += uppercase[Math.floor(Math.random() * uppercase.length)];
  password += special[Math.floor(Math.random() * special.length)];

  // Fill the rest with random characters
  for (let i = password.length; i < length; i++) {
    password += allChars[Math.floor(Math.random() * allChars.length)];
  }

  // Shuffle the result to mix initial characters
  return password.split('').sort(() => 0.5 - Math.random()).join('');
}

generateBtn.addEventListener("click", () => {
  const password = generatePassword(16);
  passwordField.value = password;
});

copyBtn.addEventListener("click", () => {
  passwordField.select();
  document.execCommand("copy");
  copyBtn.innerText = "#";
  setTimeout(() => (copyBtn.innerText = "#"), 1500);
});

