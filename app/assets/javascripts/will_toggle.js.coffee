$ ->
  willToggle.bindAndSetInitialVisibility()
  
willToggle =
  toggleDiv: ->
    $(this).parent().parent().find('.will-toggle-content').slideToggle(100)