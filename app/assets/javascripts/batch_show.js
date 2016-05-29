$(document).ready(ready)
$(document).on('page:load', ready)

function ready() {

    onBatchShowLoadReady();
    setBatchShowListeners();

};

function onBatchShowLoadReady(){
  $("#complete_btn").click(function(){
    $.ajax({
      url: $(this).attr("patchPath"),
      method: "PATCH",
      dataType: "json",
      success: doSuccess
    });
  });

  if ( $("#progress-counter").text() === "4" ) {
    $("#complete_btn").hide();
  }
};

function doSuccess(data){
  $("#progress-counter").html(data["progress"]);
  $("#content1").html(data["content"]["content1"]);
  $("#content2").html(data["content"]["content2"]);
  $("#content3").html(data["content"]["content3"]);
};

function setBatchShowListeners(){
  
};