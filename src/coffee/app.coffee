
# Importing JSON data and necessary modules

import jsonData from '../json/data.json'
import generateDOM from './modules/generate-dom.coffee'
import changeSequence from './modules/change-sequence.coffee'

# Listener to start function only when page loads

window.addEventListener 'load', () ->



  # Getting main element and appending generated DOM elements

  (window.document.querySelector '.js-main').innerHTML += generateDOM jsonData;
  button.addEventListener 'click', changeSequence for button in ( window.document.querySelectorAll '.js-sequence-btn' )

  # Animating the intro box

  (window.document.querySelector '.js-intro-box').classList.add 'intro-box--fadein'
