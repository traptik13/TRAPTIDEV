import { LightningElement } from 'lwc';
import LightningPrompt from "lightning/prompt";
 
export default class PromptModalExample extends LightningElement {
handlePromptClick() {
    LightningPrompt.open({
      message: "Please enter your feedback:",
      // theme defaults to "default"
      label: "Please Respond!", // this is the header text 
      defaultValue: "Optional initial input value ...!!",
    }).then((result) => {
      // prompt modal has been closed
    });
  }
}