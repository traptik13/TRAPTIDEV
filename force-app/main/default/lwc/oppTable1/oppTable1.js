import { LightningElement, wire, track } from 'lwc';
import getRecentOpportunities from '@salesforce/apex/OpportunityController1.getRecentOpportunities';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const COLUMNS = [
    { label: 'Opportunity Name', fieldName: 'Name' },
    { label: 'Stage', fieldName: 'StageName' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' }
];

export default class OppTable1 extends LightningElement {
    columns = COLUMNS;
    @track isModalOpen = false;
    wiredOppResult; // Used for refreshApex
    opportunities;

    @wire(getRecentOpportunities)
    wiredOpps(result) {
        this.wiredOppResult = result;
        console.log('this.wiredOppResult>>>',JSON.stringify(this.wiredOppResult));
        if (result.data) {
            this.opportunities = result.data;
            console.log('this.opp>>>',this.opportunities);
        }
    }

    // Modal logic
    handleOpenModal() {
        this.isModalOpen = true;
    }

    handleCloseModal() {
        this.isModalOpen = false;
    }

    // After successful record creation
    handleSuccess(event) {
        this.isModalOpen = false;
        
        // Show success message
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Opportunity created successfully!',
                variant: 'success'
            })
        );

        // Refresh the table data
        return refreshApex(this.wiredOppResult);
    }
}