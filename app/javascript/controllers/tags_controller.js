import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"
export default class extends Controller {
  static targets = ["input"]
  static values = { tags: Array }
  connect() {
    const urlSearchParams = new URLSearchParams(window.location.search);
    const queryParameters = {};
    for (const [key, value] of urlSearchParams.entries()) {
      queryParameters[key] = value;
    }

    const tagify = new Tagify(this.inputTarget, {
      whitelist: this.tagsValue,
      tagTextProp: "name",
      dropdown : {
          classname     : "label-tags",
          enabled       : 0,              // show the dropdown immediately on focus
          maxItems      : 10,
          position      : "all",         // place the dropdown near the typed text
          closeOnSelect : false,          // keep the dropdown open after selecting a suggestion
          highlightFirst: true,
          mapValueTo: "name",
      }
    });
    if (Object.keys(queryParameters).length !== 0 ) {
      tagify.addTags(JSON.parse(queryParameters.tags))
    }
  }

  #updateTags(tagify) {
    console.log("do something");
    tagify.loading(true).dropdown.hide()

  fetch('/tags', {
    headers: {
      "Accept": "application/json",
    }
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data)

      tagify.whitelist = data // update whitelist Array in-place
      tagify.loading(false).dropdown.show(value) // render the suggestions dropdown
    }
    //   function(newWhitelist){
    // }
    )
  }
}







//   // show loading animation and hide the suggestions dropdown
