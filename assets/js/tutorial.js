// vim:foldmethod=marker

// OS Picker {{{
const androidOsElem = document.getElementById("os-android");
const iosOsElem = document.getElementById("os-ios");

if (androidOsElem && iosOsElem) {
  // Set the os on page load from localStorage
  setOs(osFromLocalStorage()); // os: "android" | "ios"

  // Event listeners
  androidOsElem.addEventListener("click", () => setOs("android"));
  iosOsElem.addEventListener("click", () => setOs("ios"));
}

// }}}
