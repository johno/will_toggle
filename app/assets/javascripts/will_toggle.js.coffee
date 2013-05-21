$ ->
  # willToggle.bindAndSetInitialVisibility()
  
window.willToggle =
  toggleNext: (toggleID) ->
    $(toggleID).slideToggle(200)