window.willToggle =
  toggleNext: (toggleID, clearData = false) ->
    $(toggleID).slideToggle(200)
    $(toggleID).find('input').val('') if clearData