// vim:foldmethod=marker

// OS {{{

const OS_REGEX = /(ios|android)$/;

// Helper functions
function setOs(os) {
  if (os == "android") {
    androidOsElem.classList.add("active");
    iosOsElem.classList.remove("active");
  } else {
    androidOsElem.classList.remove("active");
    iosOsElem.classList.add("active");
  }

  localStorage.setItem("os", os);

  if (getCurrentOs() == os) return;
  window.location.href = window.location.href.replace(OS_REGEX, os);
}

function osFromLocalStorage() {
  return localStorage.getItem("os") || "android";
}

function getCurrentOs() {
  return OS_REGEX.exec(window.location.href)[0];
}
// }}}
