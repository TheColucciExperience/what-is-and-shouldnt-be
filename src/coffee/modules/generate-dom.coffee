
# Importing module to buid chapters

import buildChapter from './build-chapter.coffee'

###
This module will init the application and dynamically create the necessary DOM components
###

generateDOM = (json) ->

  # Object to store chapters in html, chapter count and sequence count

  chaptersCtrl =
    html: ''
    chapterCount: 1
    sequenceCount: 0

  # This will store the count

  chaptersCtrl.html += buildChapter chaptersCtrl, chapter for chapter in json.chapters

  return chaptersCtrl.html


export default generateDOM
