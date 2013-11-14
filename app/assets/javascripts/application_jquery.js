function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  var content = content.replace(regexp, new_id);
  if ($('.fields').length){
    $('.fields:last').after(content);
  }else{
    $(link).parent().after(content);
  }
}