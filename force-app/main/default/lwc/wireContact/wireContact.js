import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/WireContactController.getContacts';
import { refreshApex } from '@salesforce/apex';

export default class WireContact extends LightningElement {

    contacts;
    error;

    wiredContactsResult;

    @wire(getContacts)
    wiredContacts(result) {

        this.wiredContactsResult = result;

        if (result.data) {
            this.contacts = result.data;
            this.error = undefined;
        }
        else if (result.error) {
            this.error = result.error;
            this.contacts = undefined;
        }
    }

    handleRefresh() {

        refreshApex(this.wiredContactsResult)
            .then(() => {
                console.log('Contacts refreshed');
            })
            .catch(error => {
                console.error(error);
            });
    }
}