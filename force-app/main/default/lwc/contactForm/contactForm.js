import { LightningElement, track } from 'lwc';
import validateAndCreateContact
    from '@salesforce/apex/ContactEmailController.validateAndCreateContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactForm extends LightningElement {

    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track accountId;

    handleChange(event) {
        const field = event.target.dataset.field;
        if (field === 'FirstName') this.firstName = event.target.value;
        if (field === 'LastName') this.lastName = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

    handleAccountChange(event) {
        this.accountId = event.detail.recordId;
    }

    handleSave() {

        // Client-side email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(this.email)) {
            this.showToast('Error', 'Please enter a valid email address', 'error');
            return;
        }

        if (!this.accountId) {
            this.showToast('Error', 'Please select an Account', 'error');
            return;
        }

        const contactRecord = {
            FirstName: this.firstName,
            LastName: this.lastName,
            Email: this.email,
            AccountId: this.accountId
        };

        validateAndCreateContact({ con: contactRecord })
            .then(() => {
                this.showToast('Success', 'Contact created successfully', 'success');
                this.resetForm();
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    resetForm() {
        this.firstName = '';
        this.lastName = '';
        this.email = '';
        this.accountId = null;
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}