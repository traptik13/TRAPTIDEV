import { LightningElement, wire } from 'lwc';
import getRecentOpportunities from '@salesforce/apex/OpportunityController.getRecentOpportunities';

// Define the columns for the datatable
const COLUMNS = [
    { label: 'Opportunity Name', fieldName: 'Name', type: 'text' },
    { label: 'Stage', fieldName: 'StageName', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' }
];

export default class OppTable extends LightningElement {
    columns = COLUMNS;

    @wire(getRecentOpportunities)
    opportunities; // This will store 'data' and 'error'
}