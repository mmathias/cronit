# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hide_all_products = () ->
  do $("section.products .product").hide
  do $("section.products .product").parent().hide

show_products = (id) ->
  products_section = $("section.products #" + id)
  do products_section.show
  do products_section.parent().show

increase_counter = (element) ->
  element.css('opactity', '0.5')
  element.css('background-color', 'black')
  counter_section = element.find('.counter')
  if (counter_section.html() != "")
    counter = parseInt(counter_section.html())
  else
    counter = 0
  counter++
  counter_section.html counter

$(document).ready ->
  $(".business-products").bind 'click', ->
    hide_all_products()
    show_products($(this).attr 'id')	
  $("section.products section.product li").bind 'click', ->
    increase_counter($(this))