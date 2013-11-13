# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

updateHiddenHashFormField = (product_id, value)-> 
  hash_value = $('#calendar_products_hash').val()
  if (!hash_value)
    old_products_hash = []
  else
    old_products_hash = JSON.parse hash_value
  products_hash_object = {"product_id":product_id,"quantity":value}

  changed = false
  for old_product_hash of old_products_hash
    old_product_hash_obj = old_products_hash[old_product_hash]
    if old_product_hash_obj.product_id == product_id
      old_product_hash_obj.quantity = value
      changed=true
      console.log(old_product_hash_obj)
      break
  if !changed
    old_products_hash.push(products_hash_object)
  $('#calendar_products_hash').val(JSON.stringify(old_products_hash))

hide_all_products = () ->
  products_listed = $("section.business-products")
  do products_listed.hide
  do products_listed.parent().hide

show_products = (id) ->
  products_section = $("section.businesses-products #" + id)
  do products_section.show
  do products_section.parent().show

increase_counter = (element) ->
  element.css('opactity', '0.5')
  element.css('background-color', 'red')
  counter_section = element.find('.counter')
  if (counter_section.html() != "")
    counter = parseInt(counter_section.html())
  else
    counter = 0
  counter++
  counter_section.html counter
  updateHiddenHashFormField(element.attr('id'), counter)

$(document).ready ->
  $(".business-link").bind 'click', ->
    hide_all_products()
    show_products($(this).attr 'id')	
  $("section.businesses-products section.business-products li").bind 'click', ->
    increase_counter($(this))