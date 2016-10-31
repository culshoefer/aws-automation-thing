$(document).ready(function() {
  function getReferences(success, error) {
    $.get( "/references/", function(rawData) {
      if(rawData.error && rawData.error != null) {
        error(rawData.error);
      } else {
        success(rawData.data);
      }
    })
    .fail(error);
  }

  function overwriteReferences(referenceData) {
    clearAllReferences();
    for(int i = 0; i < referenceData.length; i++) {
      var reference = referenceData[i];
      addReferenceToUI(reference);
    }
  }

  function clearAllReferences(){
    console.log("References cleared!");
    //we don't have the DOM done yet, so just simulate htis
  }

  function addReferenceToUI(reference) {
    console.log(JSON.stringify(reference));
    //we don't have the DOM done yet, so just print elements
  }

  getReferences(overwriteReferences, console.log);
});
