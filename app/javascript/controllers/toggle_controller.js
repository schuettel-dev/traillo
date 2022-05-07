import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleable", "actionButtons", "showButton", "closeButton"];
  static values = { opened: Boolean }

  connect() {
    this.actionButtonsTarget.classList.remove("hidden");
    this.render()
  }

  render() {
    this.showIfClosed(this.showButtonTarget);
    this.showIfOpened(this.closeButtonTarget);
    this.showIfOpened(this.toggleableTargets);
  }

  show() {
    this.openedValue = true;
    this.render();
  }

  close() {
    this.openedValue = false;
    this.render()
  }

  showIfOpened(elements) {
    this.toggle(elements, !this.openedValue)
  }

  showIfClosed(elements) {
    this.toggle(elements, this.openedValue);
  }

  toggle(elements, force) {
    [].concat(elements).map(element => element.classList.toggle("hidden", force))
  }
}
