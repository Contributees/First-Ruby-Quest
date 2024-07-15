import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dismissible"
export default class extends Controller {
  static targets = ["element"];

  dismiss() {
    this.elementTarget.remove();
  }
}
