# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $(".add").on "click", ->
    if $(".second").is(":hidden") 
      $(".second").toggle() 
      $(".remove").toggle()
    else if $(".third").is(":hidden")
      $(".third").toggle()
    else if $(".fourth").is(":hidden")
      $(".fourth").toggle()
    else if $(".fifth").is(":hidden")
      $(".fifth").toggle()
    else if $(".rant").is(":hidden")
      $(".rant").toggle()
      $(".add").toggle()
      $(".remove").toggle()
      $(".removerant").toggle()
  
  $(".remove").on "click", ->
    if $(".fifth").is(":visible")
      $(".fifth").toggle()
    else if $(".fourth").is(":visible")
      $(".fourth").toggle()
    else if $(".third").is(":visible")
      $(".third").toggle()
    else if $(".second").is(":visible")
      $(".second").toggle()
      $(".remove").toggle()

  $(".removerant").on "click", ->
    $(".removerant").toggle()
    $(".add").toggle()
    $(".remove").toggle()
    $(".rant").toggle()
      

