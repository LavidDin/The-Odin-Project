const selectionButtons = document.querySelectorAll('[data-selection]')
const finalColumn = document.querySelector('[data-final-column]')
const computerScoreSpan = document.querySelector('[data-computer-score]')
const yourScoreSpan = document.querySelector('[data-your-score]')
const computerChoice = document.querySelector('[computer-choice]')
const yourChoice = document.querySelector('[your-choice]')
const playAgain = document.getElementById('play')
const status = document.getElementById('status')

playAgain.style.display = 'none'
const SELECTIONS = [
  {
    name: 'rock',
    emoji: '✊',
    beats: 'scissors'
  },
  {
    name: 'paper',
    emoji: '✋',
    beats: 'rock'
  },
  {
    name: 'scissors',
    emoji: '✌',
    beats: 'paper'
  }
]

selectionButtons.forEach(selectionButton => {
  selectionButton.addEventListener('click', e => {
    const selectionName = selectionButton.dataset.selection
    const selection = SELECTIONS.find(selection => selection.name === selectionName)
    makeSelection(selection)
  })
})

function makeSelection(selection) {
  const computerSelection = randomSelection()
  computerChoice.innerHTML = `Computer Chose: ${computerSelection.emoji}`
  yourChoice.innerHTML = `You Chose: ${selection.emoji}`
  const yourWinner = isWinner(selection, computerSelection)
  const computerWinner = isWinner(computerSelection, selection)
  
  if (yourWinner) incrementScore(yourScoreSpan)
  if (computerWinner) incrementScore(computerScoreSpan)
  gameOver()
}

function gameOver() {
  if (computerScoreSpan.innerText == '5') {
    status.innerHTML = 'The Computer wins this time!'
    playAgain.style.display = 'block';

    selectionButtons.forEach(selectionButton => {
      selectionButton.style.display = 'none'
    })
    playAgain.addEventListener('click', refreshPage);
  }
  else if (yourScoreSpan.innerText == '5') {
    status.innerHTML = 'Congratulations you win!'
    playAgain.style.display = 'block';

    selectionButtons.forEach(selectionButton => {
      selectionButton.style.display = 'none'
    })
    playAgain.addEventListener('click', refreshPage);
  }
}

function incrementScore(scoreSpan) {
  scoreSpan.innerText = parseInt(scoreSpan.innerText) + 1
}

function isWinner(selection, opponentSelection) {
  return selection.beats === opponentSelection.name
}

function randomSelection() {
  const randomIndex = Math.floor(Math.random() * SELECTIONS.length)
  return SELECTIONS[randomIndex]
}

function refreshPage() {
        window.location.reload(true);
}