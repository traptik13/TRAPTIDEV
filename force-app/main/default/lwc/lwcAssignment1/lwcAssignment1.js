import { LightningElement, wire, track } from 'lwc';
import getUsers from '@salesforce/apex/LwcAssignment1.getUsers';
import createUser from '@salesforce/apex/LwcAssignment1.createUser';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const ACTIONS = [
    { label: 'Edit', name: 'edit' }
];

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'UserName', fieldName: 'Username' },
    { label: 'Active', fieldName: 'IsActive' },
    { label: 'Email', fieldName: 'Email' },
    { type: 'action', typeAttributes: { rowActions: ACTIONS } }
];

export default class lwcAssignment1 extends LightningElement {

    columns = COLUMNS;

    @track users = [];
    @track isModalOpen = false;
    @track currentRecordId;

    lastName = '';
    email = '';
    username = '';
    profileId = '';

    wiredAccountsResult;

    get isEditMode() {
        return this.currentRecordId ? true : false;
    }

    get isNewMode() {
        return !this.currentRecordId;
    }

    get modalTitle() {
        return this.isEditMode ? 'Edit User' : 'New User';
    }

    @wire(getUsers)
    wiredAccounts(result) {

        this.wiredAccountsResult = result;

        if (result.data) {
            this.users = result.data;
        } else if (result.error) {
            console.error('Error fetching users:', result.error);
        }
    }

    handleRowAction(event) {

        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (actionName === 'edit') {
            this.currentRecordId = row.Id;
            this.isModalOpen = true;
        }
    }

    openNewModal() {

        this.currentRecordId = undefined;
        this.lastName = '';
        this.email = '';
        this.username = '';
        this.profileId = '';
        this.isModalOpen = true;
    }

    handleChange(event) {

        const field = event.target.dataset.field;
        this[field] = event.target.value;
    }

    handleProfileChange(event) {

        this.profileId = event.detail.value[0];
    }

   async handleSave() {
    const inputs = this.template.querySelectorAll('lightning-input');
    let isValid = true;

    inputs.forEach(input => {
        if (!input.reportValidity()) {
            isValid = false;
        }
    });

    if (!isValid || !this.profileId) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: 'Please fill all required fields correctly',
                variant: 'error'
            })
        );
        return;
    }

    try {
        await createUser({
            lastName: this.lastName,
            email: this.email,
            username: this.username,
            profileId: this.profileId
        });

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'User created successfully',
                variant: 'success'
            })
        );

        await refreshApex(this.wiredAccountsResult);
        this.closeModal();

    } catch (error) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: error.body?.message || error.message || 'Error creating user',
                variant: 'error'
            })
        );
        console.error('Error creating user:', error);
    }
}

    handleSuccess() {

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'User updated successfully',
                variant: 'success'
            })
        );

        this.closeModal();

        refreshApex(this.wiredAccountsResult);
    }

    handleError(event) {

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: event.detail.message,
                variant: 'error'
            })
        );
    }

    closeModal() {

        this.isModalOpen = false;
        this.currentRecordId = undefined;
    }
}