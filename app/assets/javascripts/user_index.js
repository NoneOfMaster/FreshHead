$(document).ready(userIndexReady)
$(document).on('page:load', userIndexReady)

function userIndexReady() {

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

// look into why you can toggle these buttons faster than the server can process
// and how to work with this
function adminize(data){
  var DOMel = "#user-" + data["id"] + "-role";
  $(DOMel).text().trim() === "User" ? $(DOMel).html("Admin") : $(DOMel).html("User");
};

function preventFirstAdminDeletion(){
  $("#user-1-role").parents("tr").find("a[data-method=delete]").hide();
  $("#user-1-role").parents("tr").find("button.adminizer").hide();
};
