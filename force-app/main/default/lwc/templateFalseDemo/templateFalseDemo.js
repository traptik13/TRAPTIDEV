import { LightningElement, track } from "lwc";
export default class TemplateFalseDemo extends LightningElement {
  //if:false demo logic
  hideText = false;
  hideHandler() {
    this.hideText = true;
  }
}