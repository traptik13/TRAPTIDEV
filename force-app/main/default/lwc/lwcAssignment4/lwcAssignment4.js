import { LightningElement, wire } from 'lwc';
import getActiveStudents from '@salesforce/apex/LwcAssignment4.getActiveStudents';

export default class LwcAssignment4 extends LightningElement {

    numberOfRecords;
    students = [];
    errorMessage = '';
    showNoRecords = false;

    columns = [
        {label: 'Name', fieldName: 'Name'},
        {label: 'Course', fieldName: 'Course__c'},
        {label: 'College', fieldName: 'College__c'},
        {label: 'Active', fieldName: 'Active__c', type: 'boolean'}        
    ];

    @wire(getActiveStudents, { numberOfRecords: null })
    wiredStudents({ error, data }) {
        if (data) {
            this.students = data;
            this.errorMessage = '';
        } else if (error) {
            this.errorMessage = error.body?.message || 'Error while fetching initial student records.';
            this.students = []; 
        }
    }

    handleNumberChange(event) {
        this.numberOfRecords = event.target.value;
        this.errorMessage = '';
    }

    handleSearch() {
        this.errorMessage = '';
        this.showNoRecords = false;

        const count = Number(this.numberOfRecords);

        if (!this.numberOfRecords || count <= 0) {
            this.students = []; 
            this.errorMessage = 'No Records';
            return;
        }

        getActiveStudents({ numberOfRecords: count })
            .then(result => {
                this.students = result;
                if (result.length === 0) {
                    this.showNoRecords = true;
                }
            })
            .catch(error => {
                this.students = []; 
                this.errorMessage = error.body?.message || 'Error while fetching student records.';
            });
    }
}