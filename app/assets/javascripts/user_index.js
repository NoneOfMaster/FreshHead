$(document).ready(ready)
$(document).on('page:load', ready)

function ready() {

    setUserIndexListeners();
    preventFirstAdminDeletion();

};

function setUserIndexListeners(){
  $(".adminizer").click(function(){
    $.ajax({
      url: $(this).attr("patchPath"),
      method: "PATCH",
      dataType: "json",
      success: adminize
    });
  });
};

function adminize(data){
  var DOMel = "#user-" + data["id"] + "-role";
  $(DOMel).text().trim() === "User" ? $(DOMel).html("Admin") : $(DOMel).html("User");
};

function preventFirstAdminDeletion(){
  $("#user-5-role").parents("tr").find("a[data-method=delete]").hide();
  $("#user-5-role").parents("tr").find("a.adminizer").hide();
};