import Typed from 'typed.js';

var options = {
  strings: ["Facilitez la gestion de vos avantages salariés", "Gagnez du temps et de l'argent"],
  backSpeed: 10,
  typeSpeed: 55,
  loop: true
}

const html_typed = document.getElementById("typed");

var typed = new Typed(html_typed, options);

export {typed};

// Facilitez la gestion de vos avantages salariés
