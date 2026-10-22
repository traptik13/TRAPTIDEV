import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ToastModesExample extends LightningElement {

    // 1. DISMISSIBLE: Standard real value for successfully creating a business record
    handleDismissible() {
        const evt = new ShowToastEvent({
            title: 'Account Created',
            message: 'Acme Corp record has been saved successfully.',
            variant: 'success',
            mode: 'dismissible' // User can close immediately, or it autohides in 3 seconds
        });
        this.dispatchEvent(evt);
    }

    // 2. PESTER: Real value for a quick background system notification
    handlePester() {
        const evt = new ShowToastEvent({
            title: 'Syncing Complete',
            message: 'Synchronized 24 contacts with Outlook.',
            variant: 'info',
            mode: 'pester' // Disappears quietly in 3 seconds; no close button
        });
        this.dispatchEvent(evt);
    }

    // 3. STICKY: Real value for a system error that needs active user reading
    handleSticky() {
        const evt = new ShowToastEvent({
            title: 'Save Failed',
            message: 'REQUIRED_FIELD_MISSING: The field "Billing Country" must be populated.',
            variant: 'error',
            mode: 'sticky' // Will stay on screen until user explicitly clicks the 'X' button
        });
        this.dispatchEvent(evt);
    }
}