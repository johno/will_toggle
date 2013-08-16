window.willToggle =
  toggleNext: (toggleID, clearData = false) ->
    $(toggleID).slideToggle(200)
    $(toggleID).find('input').val('') if clearData

  toggleRadios: (name, toggleID, clearData = false) ->
    $("[name='" + name + "']").parent().parent().find(".will-toggle-content").slideUp(200)
    $(toggleID).slideDown(200)
