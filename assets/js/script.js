/* Font size changer */
const incFontButton = document.getElementById("increaseFont");
const decFontButton = document.getElementById("decreaseFont");
const resetFontButton = document.getElementById("resetFont");

incFontButton.addEventListener("click", () => {
  changeFontSize(5);
});

decFontButton.addEventListener("click", () => {
  changeFontSize(-5);
});

resetFontButton.addEventListener("click", () => {
  changeFontSize(15, true);
});

function changeFontSize(change, absolute) {
  for (const el of document.getElementsByClassName("content")) {
    let size = parseInt(el.style.fontSize, 10);
    if (!size || isNaN(size)) size = 15;
    if (absolute) size = change;
    else size += change;
    el.style.fontSize = `${size}px`;
  }
}

/* Scroll progress bar */
document.addEventListener("scroll", () => {
  const docElem = document.documentElement;
  const docBody = document.body;
  const scrollTop = docElem["scrollTop"] || docBody["scrollTop"];
  const scrollBottom =
    (docElem["scrollHeight"] || docBody["scrollHeight"]) - window.innerHeight;
  const scrollPercent = (scrollTop / scrollBottom) * 100 + "%";

  const progressBar = document.getElementById("progress-bar");
  if (progressBar)
    progressBar.style.setProperty("--scrollAmount", scrollPercent);
});
