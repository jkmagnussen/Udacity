//Implimenting the dynamic navigation bar

let sections = document.querySelectorAll('section');
var navbar = document.querySelector('#navbar__list');

const dynamicNav = () => {
  // incrimentally traverse through sections
    for (i= 0; i < sections.length; i++) {
        const encap = sections[i].querySelector('h2').textContent;
		var itemAdd = document.createElement('li');
		var a_tag=document.createElement('a');
    a_tag.href='#'+sections[i].id
    a_tag.className = encap;
		a_tag.textContent = encap;
        itemAdd.appendChild(a_tag);
        navbar.appendChild(itemAdd);
        console.log(itemAdd);
    }
};
dynamicNav();

//implimenting an active status to each section 

var isInViewport = function (elem) {
  var bounding = elem.getBoundingClientRect();
  return (
      bounding.top >= 0 &&
      bounding.left >= 0 &&
      (bounding.bottom <= window.innerHeight || document.documentElement.clientHeight) &&
      bounding.right <= (window.innerWidth || document.documentElement.clientWidth)
  );
};
//Event listener cycling through which color to highlight 
// on isInViewport arrival.
var about = document.querySelector('#section1');
var portfolio = document.querySelector('#section2');
var contact = document.querySelector('#section3');
window.addEventListener('scroll', function (event) {
	if (isInViewport(about)) {
    document.querySelector('.About').style.backgroundColor = 'rgba(163, 36, 36, 0.77)';
    document.querySelector('.Portfolio').style.backgroundColor = 'rgba(93, 101, 99, 0.12)';
    document.querySelector('.Contact').style.backgroundColor = 'rgba(93, 101, 99, 0.12)';
	} else if (isInViewport(portfolio)) {
    document.querySelector('.About').style.backgroundColor = 'rgba(93, 101, 99, 0.12)';
    document.querySelector('.Portfolio').style.backgroundColor = 'rgba(163, 36, 36, 0.77)';
    document.querySelector('.Contact').style.backgroundColor = 'rgba(93, 101, 99, 0.12)';
  } else if (isInViewport(contact)) {
    document.querySelector('.About').style.backgroundColor = 'rgba(93, 101, 99, 0.12)';
    document.querySelector('.Portfolio').style.backgroundColor = 'rgba(93, 101, 99, 0.12)';
    document.querySelector('.Contact').style.backgroundColor = 'rgba(163, 36, 36, 0.77)';
  }
});

