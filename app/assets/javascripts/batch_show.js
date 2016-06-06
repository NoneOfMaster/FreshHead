$(document).ready(batchShowReady)
$(document).on('page:load', batchShowReady)

function batchShowReady() {

    onBatchShowLoadReady();

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

  nextButtonVisability()
};

function doSuccess(data){
  $("#progress-counter").html(data["progress"]);
  $("#content1").html(data["content"]["content1"]);
  $("#content2").html(data["content"]["content2"]);
  if ( data["content"]["content3"].slice(0,4) === "http" ) {
    $("#content3").html("BONUS: <a href=" + data["content"]["content3"] + " target='_blank'>Read the whole story</a>.")
  } else {
    $("#content3").html(data["content"]["content3"]);
  }
  nextButtonVisability()
};

function nextButtonVisability() {
  if ( $("#progress-counter").text() === "4" ) {
    $("#complete_btn").hide();
  }
};