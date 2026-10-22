// toastExample.js
import { LightningElement } from "lwc";
import LightningToast from "lightning/toast";


export default class ToastExample extends LightningElement {
  async handleToastClick() {
    await LightningToast.show(
      {
        label: "Sample title with {0} and {1}",
        labelLinks: [
          {
            url: "https://www.lightningdesignsystem.com/components/toast/",
            label: "SLDS link",
          },
          {
            url: "https://www.lightningdesignsystem.com/accessibility/guidelines/global-focus/#toasts",
            label: "toast guideline",
          },
        ],
        message: "Sample message with {salesforceLink} and {slackLink}",
        messageLinks: {
          salesforceLink: {
            url: "http://www.salesforce.com",
            label: "Salesforce link",
          },
          slackLink: {
            url: "https://slack.com",
            label: "Slack link",
          },
        },
        mode: "sticky",
        variant: "success",
      },
      this,
    );
  }
}