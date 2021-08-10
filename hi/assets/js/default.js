const tutorialsList = document.getElementById("tutorials-list");
for (const child of tutorialsList.children) {
  if (
    child.nodeName == "LI" &&
    child.firstElementChild &&
    child.firstElementChild.nodeName == "A"
  ) {
    const a = child.firstElementChild;
    a.setAttribute(
      "href",
      a.getAttribute("href").replace(OS_REGEX, osFromLocalStorage())
    );
  }
}
