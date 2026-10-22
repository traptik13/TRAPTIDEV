import { LightningElement, wire, track } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const ACTIONS = [
    { label: 'Edit', name: 'edit' }
];

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { type: 'action', typeAttributes: { rowActions: ACTIONS } } // The Edit button
];

export default class AccountTable extends LightningElement {
    columns = COLUMNS;
    @track accounts = [];
    @track isModalOpen = false;
    @track currentRecordId;
    wiredAccountResult;

    @wire(getAccountList)
    wiredAccounts(result) {
        this.wiredAccountResult = result;
        if (result.data) {
            this.accounts = result.data;
        }
    }

    // Handle the button click on the row
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'edit') {
            this.currentRecordId = row.Id; // Get ID of the specific row
            this.isModalOpen = true;      // Open the popup
        }
    }

    closeModal() {
        this.isModalOpen = false;
    }

    handleSuccess() {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Account updated successfully',
                variant: 'success'
            })
        );
        this.isModalOpen = false;
        return refreshApex(this.wiredAccountResult); // Refresh the table
    }
}