import { LightningElement, wire } from 'lwc';
import getUsers from '@salesforce/apex/Assignment1.getUsers';
import { refreshApex } from '@salesforce/apex';
import USER_OBJECT from '@salesforce/schema/User';
import PROFILE_FIELD from '@salesforce/schema/User.Profile.Name';
import USERNAME_FIELD from '@salesforce/schema/User.Username';
import LAST_NAME_FIELD from '@salesforce/schema/User.LastName';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import ACTIVE_FIELD from '@salesforce/schema/User.IsActive';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class assignment1 extends LightningElement {

    users = [];

    wiredUsersResult;
    showModal = false;
    selectedUserId;
    isEdit = false;
    isLoading = true;

    userObject = USER_OBJECT;

    profileField = PROFILE_FIELD;
    usernameField = USERNAME_FIELD;
    lastNameField = LAST_NAME_FIELD;
    emailField = EMAIL_FIELD;
    activeField = ACTIVE_FIELD;

    @wire(getUsers)
    wiredUsers(result) {

        this.wiredUsersResult = result;

        const {
            data,
            error
        } = result;

        this.isLoading = false;

        if (data) {
            this.users = data;
        }


        else if (error) {
            this.users = [];
            this.showToast(
                'Error',
                this.getErrorMessage(error),
                'error'
            );
        }

    }

    get modalTitle() {

        return this.isEdit
            ? 'Edit User'
            : 'New User';

    }

    handleNew() {

        this.selectedUserId = undefined;

        this.isEdit = false;

        this.showModal = true;

    }

    handleEdit(event) {

        this.selectedUserId =
            event.currentTarget.dataset.id;

        this.isEdit = true;

        this.showModal = true;

    }

    handleCancel() {

        this.showModal = false;

        this.selectedUserId = undefined;

    }

    async handleSuccess() {

        this.showModal = false;

        this.showToast(
            'Success',

            this.isEdit
                ? 'User updated successfully.'
                : 'User created successfully.',

            'success'
        );


        this.selectedUserId = undefined;

        // Refresh table
        await refreshApex(
            this.wiredUsersResult
        );

    }

    handleError(event) {
        this.showToast(
            'Error',
            event.detail?.message ||
            'Unable to save User.',
            'error'
        );

    }

    showToast( title, message, variant) {

        this.dispatchEvent(

            new ShowToastEvent({

                title: title,

                message: message,

                variant: variant

            })

        );

    }


    getErrorMessage(error) {

        if (
            Array.isArray(error?.body)
        ) {

            return error.body
                .map(item => item.message)
                .join(', ');

        }


        return (
            error?.body?.message ||
            error?.message ||
            'Unknown error'
        );

    }

}