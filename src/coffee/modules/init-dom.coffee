
# Importing module to buid chapters

import buildChapter from './build-chapter.coffee'

###
This module will init the application return create the necessary DOM components
###

initDOM = (json) ->

  # Object to store chapters in html, chapter count and sequence count

  chaptersCtrl =
    html: ''
    chapterCount: 1
    sequenceCount: 0

  # This will store the count

  chaptersCtrl.html += buildChapter chaptersCtrl, chapter for chapter in json.chapters

  window.console.log chaptersCtrl.html


export default initDOM
