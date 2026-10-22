import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController1.getAccounts';
import insertAccount from '@salesforce/apex/AccountController1.insertAccount';
import { refreshApex } from '@salesforce/apex';

export default class AccountDatatable extends LightningElement {

    accounts;
    wiredAccountsResult;

    isModalOpen = false;

    name = '';
    industry = '';
    phone = '';

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Phone', fieldName: 'Phone' }
    ];

    @wire(getAccounts)
    wiredAccounts(result) {
        this.wiredAccountsResult = result;
        if (result.data) {
            this.accounts = result.data;
        }
    }

    openModal() {
        this.isModalOpen = true;
    }

    closeModal() {
        this.isModalOpen = false;
        this.clearFields();
    }

    handleChange(event) {
        const field = event.target.dataset.field;
        this[field] = event.target.value;
    }

    async handleSave() {
        if (!this.name || !this.industry || !this.phone) {
            return;
        }

        await insertAccount({
            name: this.name,
            industry: this.industry,
            phone: this.phone
        });

        await refreshApex(this.wiredAccountsResult);

        this.closeModal();
    }

    clearFields() {
        this.name = '';
        this.industry = '';
        this.phone = '';
    }
}