let cupWidth = 100;
let cupHeight = 150;
let ballDiameter = 50;
let ballPosition = 0;
let count = 0;
function updateGame() {
    cupWidth = parseInt(document.getElementById('cupWidth').value);
    cupHeight = parseInt(document.getElementById('cupHeight').value);
    ballDiameter = parseInt(document.getElementById('ballDiameter').value);
    document.getElementById('result').textContent = '';
    document.getElementById('counter').textContent = '';
    resetCups();
    resetBall();
}
function resetCups() {
    const cups = document.getElementsByClassName('cup');
    for (let i = 0; i < cups.length; i++) {
        cups[i].style.width = cupWidth + 'px';
        cups[i].style.height = cupHeight + 'px';
        cups[i].style.transform = '';
    }
}
function resetBall() {
    const ball = document.getElementById('ball');
    const containerWidth = document.getElementById('container').offsetWidth;
    const maxPosition = containerWidth - ballDiameter;
    ballPosition = Math.floor(Math.random() * 3) + 1;
    const cup = document.getElementById(`cup${ballPosition}`);
    const cupLeft = cup.offsetLeft;
    const cupWidth = cup.offsetWidth;
    const ballLeft = cupLeft + (cupWidth - ballDiameter) / 2;
    ball.style.display = 'none';
    ball.style.width = ballDiameter + 'px';
    ball.style.height = ballDiameter + 'px';
    ball.style.left = ballLeft + 'px';
}
function guessCup(cupNumber) {
    const ball = document.getElementById('ball');
    ball.style.display = 'block';
    const cup = document.getElementById(`cup${cupNumber}`);
    cup.classList.add('lift-animation'); // Добавляем класс для анимации
    if (cupNumber === ballPosition) {
        count++;
        document.getElementById('result').textContent = 'Верно!';
    }
    else {
        count--;
        document.getElementById('result').textContent = 'Неверно!';
    }
    document.getElementById("counter").textContent = "Результат: " + count;
    setTimeout(() => {
        cup.classList.remove('lift-animation');
        resetCups();
        resetBall();
    }, 2000);
}
document.getElementById("resetButton").addEventListener("click", function() {
    count = 0;
    document.getElementById("counter").textContent = "Результат: " + count;
  });