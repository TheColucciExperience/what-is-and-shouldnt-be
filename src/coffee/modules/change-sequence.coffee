
# Private sequence variable to keep track of story progress

sequenceCount = -1

# This function will handle showing and hiding the sequence boxes

changeSequence = () ->

  if sequenceCount < 0
    # We'll hide the intro box and show the next chapter
    (window.document.querySelector '.js-intro-box').classList.add 'intro-box--fadeout'
    window.setTimeout () ->
      sequenceCount++
      (window.document.querySelector '.js-intro-box').classList.add 'hidden'
      # We need to call chapter 1, so we do it recursively
      changeSequence()
    , 1000
  else

    # Getting sequence type to determine actions to take

    sequenceType = (window.document.querySelector "[data-sequence='#{ sequenceCount }']").dataset.type

    # If it's a chapter we hide all the parts boxes, and show the chapter

    if sequenceType == 'chapter'
      # Fading and hiding all part boxes
      part.classList.add 'fast-fadeout' for part in (window.document.querySelectorAll '.js-part-box')
      window.setTimeout () ->

        part.classList.add 'hidden' for part in (window.document.querySelectorAll '.js-part-box')
        (window.document.querySelector "[data-sequence='#{ sequenceCount }']").classList.remove 'hidden'
        (window.document.querySelector "[data-sequence='#{ sequenceCount }']").classList.add 'fast-fadein'

        # Updating background image

        (window.document.querySelector '.js-page-background').style.backgroundImage =
          "url( #{ (window.document.querySelector "[data-sequence='#{ sequenceCount }']").dataset.bg } )"

        # Updating sequence count

        sequenceCount++

        # Recursive call to hide chapter and show it's parts

        changeSequence()

      , 300
    else if sequenceType == 'part'

      # Getting previous sequence type

      prevSequenceType = (window.document.querySelector "[data-sequence='#{ sequenceCount - 1 }']").dataset.type

      # Timeout to allow chapter to display on the screen

      timeoutDelay = if prevSequenceType == 'chapter' then 2000 else 0

      window.setTimeout () ->
          (window.document.querySelector "[data-sequence='#{ sequenceCount - 1 }']").classList.remove 'fast-fadein'
          (window.document.querySelector "[data-sequence='#{ sequenceCount - 1 }']").classList.add 'fast-fadeout'
          window.setTimeout () ->
            (window.document.querySelector "[data-sequence='#{ sequenceCount - 1 }']").classList.add 'hidden'
            (window.document.querySelector "[data-sequence='#{ sequenceCount }']").classList.remove 'hidden', 'fast-fadeout'
            (window.document.querySelector "[data-sequence='#{ sequenceCount }']").classList.add 'fast-fadein'
          , 300
      , timeoutDelay

      # Updating sequence count

      sequenceCount++


export default changeSequence
