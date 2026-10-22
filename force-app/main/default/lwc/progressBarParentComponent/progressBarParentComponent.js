import { LightningElement } from 'lwc';

export default class ProgressBarParentComponent extends LightningElement {
    percentage = 10
    changeHandler(event) {
        console.log('event value>>>>',event.target.value);
        this.percentage  = event.target.value <= 100 ? event.target.value : 100;
    }
}