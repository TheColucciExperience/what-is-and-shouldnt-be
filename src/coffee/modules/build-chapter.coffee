
# Requiring jade to compile templates

jade = require( 'jade' );

# This module will build each chapter and return it as a html string

buildChapter = (chaptersCtrl, chapter) ->

  # We'll create a big string of Jade and the compile it into HTML to return

  chapterJade =
    """
      section(class='chapter-box' data-sequence='#{ chaptersCtrl.sequenceCount }' data-type='chapter' data-bg='#{ chapter.background }')
        h3(class='chapter-box__subtitle') Chapter #{ chaptersCtrl.chapterCount }:
        h2(class='chapter-box__title') #{ chapter.title }
    """

  # Updating sequence count

  chaptersCtrl.sequenceCount++

  generateParts = (part, i) ->
    partJade =
      """
        section(class='part-box')
          h3(class='part-box__title') #{ chapter.parts[i].title }
          p(class='part-box__text') #{ chapter.parts[i].text }
          button(class='btn btn--default btn--outline btn--outline-white btn--align-end js-part-btn' type='button' data-sequence='#{ chaptersCtrl.sequenceCount }' data-type='part')
              | next
              span(class='btn-icon fas fa-caret-right')
      """
    chaptersCtrl.sequenceCount++
    return partJade

  chapterJade += generateParts part, i for part, i in chapter.parts

  ###
    Function to generate parts. We declare it here to avoid the inconvenience
    of passing extra variables as dependencies, by using the ones in the current
    scope.
  ###



  # Updating chapters count

  chaptersCtrl.chapterCount++

  # Returning chapter html

  return chapterJade


export default buildChapter
