
# Requiring jade to compile templates

jade = require( 'jade' );

# This module will build each chapter and return it as a html string

buildChapter = (chaptersCtrl, chapter) ->

  # We'll create a big string of Jade and the compile it into HTML to return

  chapterJade =
    """
      section(class='chapter-box hidden' data-sequence='#{ chaptersCtrl.sequenceCount }' data-type='chapter' data-bg='#{ chapter.background }')
        h3(class='chapter-box__subtitle') Chapter #{ chaptersCtrl.chapterCount }:
        h2(class='chapter-box__title') #{ chapter.title }
    """

  # Updating sequence count

  chaptersCtrl.sequenceCount++

  ###
    Function to generate parts. We declare it here to avoid the inconvenience
    of passing extra variables as dependencies, by using the ones in the current
    scope.
  ###

  generateParts = (part, i) ->

    ###
      We'll dynamically generate a random left and top position for the part box
      based on the viewport width
    ###

    viewportWidth = window.innerWidth

    switch true
      when viewportWidth < 576 then maxLeftPos = 10
      when viewportWidth < 768 then maxLeftPos = 20
      when viewportWidth < 992 then maxLeftPos = 30
      when viewportWidth < 1200 then maxLeftPos = 40
      else maxLeftPos = 50

    # Generating a random left and top position based on the min and max boundaries

    randomLeft = ( Math.floor Math.random() * (maxLeftPos - 10) ) + 10
    randomTop = ( Math.floor Math.random() * 10 ) + 10

    partJade =
      """
        \n
        section(class='part-box js-part-box hidden' data-sequence='#{ chaptersCtrl.sequenceCount }'
                data-type='part' style='left: #{ randomLeft }vw; top: #{ randomTop }vh')
          h3(class='part-box__title') #{ chapter.parts[i].title }
          p(class='part-box__text') #{ chapter.parts[i].text }
          button(class='btn btn--default btn--outline btn--outline-white btn--align-end js-sequence-btn' type='button')
              | next
              span(class='btn-icon fas fa-caret-right')
      """
    chaptersCtrl.sequenceCount++

    return partJade

  # Adding the part template to the chapter one

  chapterJade += generateParts part, i for part, i in chapter.parts

  # Updating chapters count

  chaptersCtrl.chapterCount++

  # Returning chapter html

  return jade.render chapterJade


export default buildChapter
