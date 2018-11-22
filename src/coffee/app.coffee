
# Importing JSON data and init module

import jsonData from '../json/data.json'
import initDOM from './modules/init-dom.coffee'

# Listener to start function only when page loads

window.addEventListener 'load', () ->

  # Getting main element and appending generated DOM elements

  (window.document.querySelector '.js-main').innerHTML += initDOM( jsonData );
