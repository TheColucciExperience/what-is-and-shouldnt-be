
# Private sequence variable to keep track of story progress

sequenceCount = -1

# This function will handle showing and hiding the sequence boxes

changeSequence = () ->

  # Getting DOM elements to modify

  introBoxEl = window.document.querySelector '.js-intro-box'
  pageBackgroundEl = window.document.querySelector '.js-page-background'
  partBoxEls = window.document.querySelectorAll '.js-part-box'

  if sequenceCount < 0

    # We'll hide the intro box and show the next chapter

    introBoxEl.classList.add 'intro-box--fadeout'

    window.setTimeout () ->

      sequenceCount++
      introBoxEl.classList.add 'hidden'

      # We need to call chapter 1, so we do it recursively

      changeSequence()

    , 1000

  else

    # Getting  the sequence element and type to determine actions to take

    currentSequenceEl = window.document.querySelector "[data-sequence='#{ sequenceCount }']"
    currentSequenceType = currentSequenceEl.dataset.type if currentSequenceEl
    prevSequenceEl = window.document.querySelector "[data-sequence='#{ sequenceCount - 1 }']" if sequenceCount - 1 >= 0
    prevSequenceType = prevSequenceEl.dataset.type if prevSequenceEl

    if currentSequenceEl

      # If it's a chapter we hide all the parts boxes, and show the chapter

      if currentSequenceType is 'chapter'

        # Fading and hiding all part boxes

        part.classList.add 'fast-fadeout' for part in partBoxEls

        window.setTimeout () ->

          part.classList.add 'hidden' for part in partBoxEls
          currentSequenceEl.classList.remove 'hidden'
          currentSequenceEl.classList.add 'fast-fadein'

          # Updating sequence count

          sequenceCount++

          # Recursive call to hide chapter and show it's parts

          changeSequence()

        , 300

      else if currentSequenceType is 'part'

        # Timeout to allow chapter to display on the screen

        timeoutDelay = if prevSequenceType is 'chapter' then 4000 else 0

        window.setTimeout () ->

            # Showing and updating background image

            pageBackgroundEl.classList.remove( 'hidden' )
            pageBackgroundEl.style.backgroundImage =
              "url( #{ prevSequenceEl.dataset.bg } )" if prevSequenceType is 'chapter'

            # Starting fading animations for previous sequence element

            prevSequenceEl.classList.remove 'fast-fadein'
            prevSequenceEl.classList.add 'fast-fadeout'

            # Hiding previous sequence element and showing current one

            window.setTimeout () ->

              prevSequenceEl.classList.add 'hidden'
              currentSequenceEl.classList.remove 'hidden', 'fast-fadeout'
              currentSequenceEl.classList.add 'fast-fadein'

              # Updating sequence count

              sequenceCount++

            , 300

        , timeoutDelay

    else

      # We've reached the end, so we'll display the end chapter

      chapterEndEl = window.document.querySelector '.js-chapter-end'
      chapterEndEl.classList.remove( 'hidden' )
      chapterEndEl.classList.add( 'fast-fadein' )

export default changeSequence
