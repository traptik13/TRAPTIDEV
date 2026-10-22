import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/SimpleWireController.getContacts';

export default class SimpleWireContact extends LightningElement {

    contacts;
    error;

    @wire(getContacts)
    wiredContacts(result) {

        if (result.data) {
            this.contacts = result.data;
            this.error = undefined;
        }
        else if (result.error) {
            this.error = result.error;
            this.contacts = undefined;
        }
    }
}