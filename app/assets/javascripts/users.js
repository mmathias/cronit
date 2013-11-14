function updateHiddenHashFormField(product_id, value) {
  var changed, hash_value, old_product_hash, old_product_hash_obj, old_products_hash, products_hash_object;
  hash_value = $('#calendar_products_hash').val();
  if (!hash_value) {
    old_products_hash = [];
  } else {
    old_products_hash = JSON.parse(hash_value);
  }
  products_hash_object = {
    "product_id": product_id,
    "quantity": value
  };
  changed = false;
  for (old_product_hash in old_products_hash) {
    old_product_hash_obj = old_products_hash[old_product_hash];
    if (old_product_hash_obj.product_id === product_id) {
      old_product_hash_obj.quantity = value;
      changed = true;
      break;
    }
  }
  if (!changed) {
    old_products_hash.push(products_hash_object);
  }
  $('#calendar_products_hash').val(JSON.stringify(old_products_hash));
};

function hide_all_products() {
  var products_listed;
  products_listed = $("section.business-products");
  products_listed.hide();
  products_listed.parent().hide();
};

function show_products(id) {
  var products_section;
  products_section = $("section.businesses-products #" + id);
  products_section.show();
  products_section.parent().show();
};

function increase_counter(element) {
  var counter, counter_section;
  element.css('opactity', '0.5');
  element.css('background-color', 'red');
  counter_section = element.find('.counter');
  if (counter_section.html() !== "") {
    counter = parseInt(counter_section.html());
  } else {
    counter = 0;
  }
  counter++;
  counter_section.html(counter);
  updateHiddenHashFormField(element.attr('id'), counter);
};

$(document).ready(function() {
  $(".business-link").bind('click', function() {
    hide_all_products();
    show_products($(this).attr('id'));
  });
  $("section.businesses-products section.business-products li").bind('click', function() {
    increase_counter($(this));
  });
});