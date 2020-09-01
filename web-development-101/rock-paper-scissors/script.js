
const rockButton = document.getElementById('rock');
const paperButton = document.getElementById('paper');
const scissorsButton = document.getElementById('scissors');
const display = document.getElementById('display');
const status = document.getElementById('status');
const score = document.getElementById('score');

//computer choice for the round
function computerSelection() {
  const options = ['rock', 'paper', 'scissors'];
  const selection = Math.floor(Math.random() * 3);
  return options[selection];
}

//Display
display.textContent = "Make your decision"
status.textContent = "Start a game by clicking"

//buttons for player choices
rockButton.addEventListener("click", playRound('rock'));
paperButton.addEventListener("click", playRound('paper'));
scissorsButton.addEventListener("click", playRound('scissors'));


function playRound(userChoice) {
  prompt('it has begun');
  const computerChoice = computerSelection();
  let roundWin = false;

  const tieMsg = `It's a tie! You both entered ${userChoice}`;
  const winMsg = `You win! ${userChoice} beats ${computerChoice}!`;
  const loseMsg = `You lose! ${computerChoice} beats ${userChoice}!`;

  if (userChoice === computerChoice) {
    status.textContent =`${tieMsg}`;
    return 'tie';
  }

  if (userChoice === 'rock' && computerChoice != 'paper' && computerChoice != 'rock') {
    status.textContent = `${winMsg}`;
    roundWin = true;
    return roundWin;
  }

  if (userChoice === 'paper' && computerChoice != 'scissors' && computerChoice != 'paper') {
    status.textContent = `${winMsg}`;
    roundWin = true;
    return roundWin;
  }

  if (userChoice === 'scissors' && computerChoice != 'rock' && computerChoice != 'scissors') {
    status.textContent = `${winMsg}`;
    roundWin = true;
    return roundWin;
  }

  else {
    status.textContent = `${loseMsg}`;
    return roundWin;
  }

}


/*
function game() {
  let userWinCount = 0;
  let computerWinCount = 0;


  do {
    let currentScore = `User Score: ${userWinCount} Computer Score: ${computerWinCount}`;
    console.log(currentScore);
    console.log();
    let result = playRound();

    if (result) {
      userWinCount++;
    }
    if (result === false) {
      computerWinCount++;
    }

  } while (userWinCount != 5 && computerWinCount != 5)


  if (userWinCount == 5) {
    console.log();
    console.log('Congratulations! You have defeated the machine and are victorious!');
  }
  else {
    console.log();
    console.log('You have been defeated by the machine!')
  }

}

game()

*/