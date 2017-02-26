// ES6 imports
const ReactDOMServer = window.ReactDOMServer = global.ReactDOMServer = require('react-dom/server');

import ComicCard from './components/comic_card.es6.js';
import ComicsSection from './components/comic_section.es6.js';

// Setup a global app scope
const app = window.app = global.app = {};

// Expose components to global scope
app.ComicCard = ComicCard;
app.ComicsSection = ComicsSection;
