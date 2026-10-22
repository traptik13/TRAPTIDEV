import { api, LightningElement } from 'lwc';
export default class GetChildComponent extends LightningElement {
    name = 'Defaultname';


    @api
    get itemName() {
        console.log('itemName', this.name);
        return this.name;
    }

    set itemName(value) {
        this.name = value.toLowerCase(); // optional: use if needed
        this.name = value.toUpperCase();
        console.log('itemName2', this.name);
    }
}