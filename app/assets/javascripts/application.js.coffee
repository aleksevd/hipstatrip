#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  $("@las-vegas span").each (i, e) ->
    c = Math.floor(Math.random() * 16777216).toString(16)
    c = "0" + c while (c.length < 6)

    $(e).css("color", "#" + c)

  $("@geocompletion").each (i, e) -> $(e).geocomplete()

  $("@clearable").each (i, e) ->
    $e = $(e)
    $x = $(e).parent().siblings(".icon-clear")

    $e.on "propertychange keyup input paste", ->
      if $e.val().length
        $x.fadeIn(100)
      else
        $x.fadeOut(100)

    $e.keyup()

    $x.click ->
      $e.val("")
      $e.keyup()

  $("@pushable").each (i, e) ->
    $e = $(e)
    $radio = $(e).find("input")
    $e.addClass("coolHandLuke_pressed") if $radio.attr("checked") 

    $e.click ->
      unless $e.hasClass("coolHandLuke_pressed")
        $("@pushable").not($e).removeClass("coolHandLuke_pressed")
        $e.addClass("coolHandLuke_pressed")
        $("@pushable input").not($radio).attr("checked", false)
        $radio.attr("checked", "checked")
      false
