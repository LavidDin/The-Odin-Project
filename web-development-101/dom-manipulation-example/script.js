//create a container
const container = document.querySelector('#container');

//content div
const content = document.createElement('div');
content.classList.add('content');
content.textContent = 'This is the glorious text-content!';

const para = document.createElement('p');
para.textContent = "Hey I'm red";
para.style.color = "red";
content.appendChild(para);

const head = document.createElement('h3');
head.textContent = "I'm a blue h3"
head.style.color = "blue";
content.appendChild(head);

container.appendChild(content);


//content 2 div
const content2 = document.createElement('div');
content2.classList.add('content2')
content2.style.border = "solid black";
content2.style.backgroundColor = "pink";

const head2 = document.createElement('h3');
head2.textContent = "I'm in a div"
content2.appendChild(head2);

const para2 = document.createElement('p');
para2.textContent = 'ME TOO!';
content2.appendChild(para2);

container.appendChild(content2);

//Event listeners
const btn = document.querySelector('#btn');
btn.addEventListener('click', function (e) {
  e.target.style.background = 'green';
});