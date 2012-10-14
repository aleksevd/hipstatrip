#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  $("@las-vegas span").each (i, e) ->
    c = Math.floor(Math.random() * 16777216).toString(16)
    c = "0" + c while (c.length < 6)

    $(e).css("color", "#" + c)

  $("@geocompletion").each (i, e) -> $(e).geocomplete()
