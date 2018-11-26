
# Importing JSON data and necessary modules

import jsonData from '../json/data.json'
import generateDOM from './modules/generate-dom.coffee'
import changeSequence from './modules/change-sequence.coffee'

# Listener to start function only when page loads

window.addEventListener 'load', () ->

  # Getting main element and appending generated DOM elements

  (window.document.querySelector '.js-main').innerHTML += generateDOM jsonData;

  # Adding listeners to change sequence on button clicks

  button.addEventListener 'click', changeSequence for button in ( window.document.querySelectorAll '.js-sequence-btn' )

  ###
    We'll animate the introduction box with it's custom class as it animates a
    little longer than other boxes
  ###

  (window.document.querySelector '.js-intro-box').classList.add 'intro-box--fadein'
