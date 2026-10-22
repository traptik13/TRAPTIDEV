import { LightningElement, track } from "lwc";
export default class TemplateTrueDemo extends LightningElement {
  //if:true demo logic
  @track showText = false;
  showHandler() {
    this.showText = true;
  }
}