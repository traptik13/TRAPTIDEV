import { LightningElement } from 'lwc';

export default class RenderedCallbackDemo extends LightningElement {

    isRendered = false;

    renderedCallback() {
        if (this.isRendered) {
            return; // Prevent infinite loop
        }

        this.isRendered = true;

        const div = this.template.querySelector('[data-id="message"]');
        div.style.color = 'red';
        console.log('RenderedCallback executed');
    }

    changeText() {
        const div = this.template.querySelector('[data-id="message"]');
        div.innerText = 'Text changed after render';
    }
}