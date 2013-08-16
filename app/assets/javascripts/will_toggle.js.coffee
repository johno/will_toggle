window.willToggle =
  toggleNext: (toggleID, clearData = false) ->
    $(toggleID).slideToggle(200)
    $(toggleID).find('input').val('') if clearData

  toggleRadios: (name, toggleID, clearData = false) ->
    $("[name='" + name + "']").parent().parent().find(".will-toggle-content").slideUp(200)
    $("[name='" + name + "']").val(-1);
    $(toggleID).parent().children(".radio-button").children().val(1);
    $(toggleID).slideDown(200)
