import { LightningElement, api } from 'lwc';

export default class ProgressBarChildComponent extends LightningElement {
    @api percentage1;
    get getStyle() {
        console.log('percentage1', this.percentage1);
        return 'width:' + this.percentage1 + '%';
    }
}