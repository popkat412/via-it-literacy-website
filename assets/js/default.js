const tutorialsList = document.getElementById("tutorials-list");
console.log("here");
for (const child of tutorialsList.children) {
  console.log("here: ", child);
  if (
    child.nodeName == "LI" &&
    child.firstElementChild &&
    child.firstElementChild.nodeName == "A"
  ) {
    const a = child.firstElementChild;
    console.log("href:", a.getAttribute("href"));
    a.setAttribute(
      "href",
      a.getAttribute("href").replace(OS_REGEX, osFromLocalStorage())
    );
  }
}
