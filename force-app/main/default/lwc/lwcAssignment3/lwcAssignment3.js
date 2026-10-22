import { LightningElement, wire } from 'lwc';
import getOpacRecords from '@salesforce/apex/LwcAssignment3.getOpacRecords';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LwcAssignment3 extends LightningElement {
    selectedProductId;
    opacRecords;
    wiredOpacResult;
    showModal = false;
    recordId;
    modalTitle;

    columns = [
        {label: 'Name', fieldName: 'Name'},
        {label: 'Min', fieldName: 'Min__c', type: 'number'},
        {label: 'Max', fieldName: 'Max__c', type: 'number'},
        {label: 'Price', fieldName: 'Price__c', type: 'currency'},
        {type: 'button', typeAttributes: {label: 'Edit', name: 'edit', variant: 'brand'}}
    ];

    @wire(getOpacRecords, { productId: '$selectedProductId' })
    wiredOPAC(result) {
        this.wiredOpacResult = result;
        if(result.data){
            this.opacRecords = result.data;
        }
        else if(result.error){
            console.error(result.error);
        }
    }

    handleProductChange(event){
        this.selectedProductId = event.detail.recordId;
    }

    handleNew(){
        this.recordId = undefined;
        this.modalTitle = 'New OPAC'; 
        this.showModal = true;
    }

    handleRowAction(event){
        if(event.detail.action.name === 'edit'){
            this.recordId = event.detail.row.Id;
            this.modalTitle = 'Edit OPAC';
            this.showModal = true;
        }
    }

    handleCancel(){
        this.showModal = false;
        this.recordId = undefined;
    }

    handleSuccess(){
        this.showModal = false;
        this.recordId = undefined;
        this.showToast('Success', 'Record processed successfully.', 'success');
        refreshApex(this.wiredOpacResult);
        
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}