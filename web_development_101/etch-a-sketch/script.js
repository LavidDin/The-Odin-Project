const gridSize = document.querySelector(".grid-size");
const resetbtn = document.querySelector(".reset");
const eraserBtn = document.querySelector(".erase");
const rainbowBtn = document.querySelector(".rainbow");
const blackBtn = document.querySelector(".black");
const container = document.querySelector(".container");

function random(min, max) {
  const num = Math.floor(Math.random() * (max - min)) + min;
  return num;
}

function randomColor() {
  return (
    "rgb(" +
    random(0, 255) +
    ", " +
    random(0, 255) +
    ", " +
    random(0, 255) +
    ")"
  );
}

function delGrid() {
  container.innerHTML = "";
}

function createGrid(grid) {
  container.style.setProperty("--grid-rows", grid);
  container.style.setProperty("--grid-cols", grid);

  for (let i = 0; i < grid * grid; i++) {
    let divs = document.createElement("div");
    divs.classList.add("divs");
    container.appendChild(divs);
  }
}

function setColor(color) {
  const divs = document.querySelectorAll("div");
  for (let i = 0; i < divs.length; i++) {
    divs[i].addEventListener("mouseover", function (e) {
      if (color == "black") {
        e.target.style.backgroundColor = "black";
      } else if (color == "rainbow") {
        e.target.style.backgroundColor = randomColor();
      } else {
        e.target.style.backgroundColor = "white";
      }
    });
  }
}

function clear() {
  const allDivs = document.querySelectorAll(".divs");
  allDivs.forEach((allDivs) => {
    allDivs.style.backgroundColor = "white";
  });
}

gridSize.addEventListener("click", function () {
  let size = prompt("Enter a number between 1-64");
  if (size < 1 || size > 64) {
    delGrid();
    sizeGrid(16);
    createDivs(16);
    return alert("Please enter a number between 1-64");
  }
  delGrid();
  createGrid(size);
});

resetbtn.addEventListener("click", clear);

eraserBtn.addEventListener("click", () => {
  setColor();
});

rainbowBtn.addEventListener("click", () => {
  let color = "rainbow";
  setColor(color);
});

blackBtn.addEventListener("click", () => {
  let color = "black";
  setColor(color);
});

createGrid(16);