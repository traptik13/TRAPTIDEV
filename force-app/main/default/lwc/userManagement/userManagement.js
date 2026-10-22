import { LightningElement, wire } from 'lwc';
import getUsers from '@salesforce/apex/UserManagement.getUsers';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class UserManagement extends LightningElement {

    users = [];
    wiredUsersResult;

    showForm = false;
    recordId;

    columns = [
        {label: 'Name',fieldName: 'Name'},
        {label: 'Username',fieldName: 'Username'},
        {label: 'Is Active',fieldName: 'IsActive'},
        {label: 'Email',fieldName: 'Email',type: 'email'},
        {type: 'action',typeAttributes: {rowActions: [
                    {label: 'Edit',name: 'edit'}
                ]
            }
        }
    ];


    @wire(getUsers)
    wiredUsers(result) {

        this.wiredUsersResult = result;

        if (result.data) {
            this.users = result.data;
        } else if (result.error) {
            this.showToast(
                'Error',
                result.error.body?.message || 'Unable to fetch users.',
                'error'
            );
        }
    }


    get isEditMode() {
        return !!this.recordId;
    }


    get formTitle() {
        return this.isEditMode
            ? 'Edit User'
            : 'Create User';
    }


    handleNewUser() {
        this.recordId = undefined;
        this.showForm = true;
    }


    handleRowAction(event) {

        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (actionName === 'edit') {
            this.recordId = row.Id;
            this.showForm = true;
        }
    }


    handleSuccess(event) {

        this.showToast(
            'Success',
            this.isEditMode
                ? 'User updated successfully.'
                : 'User created successfully.',
            'success'
        );

        this.showForm = false;
        this.recordId = undefined;

        refreshApex(this.wiredUsersResult);
    }


    handleError(event) {

        let message = 'Something went wrong.';

        if (event.detail?.message) {
            message = event.detail.message;
        }

        this.showToast(
            'Error',
            message,
            'error'
        );

        console.error('User Error:', event.detail);
    }


    handleCancel() {
        this.showForm = false;
        this.recordId = undefined;
    }


    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}