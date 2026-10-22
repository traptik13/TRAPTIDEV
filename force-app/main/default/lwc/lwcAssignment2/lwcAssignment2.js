import { LightningElement, track, api } from 'lwc';
import getStudents from '@salesforce/apex/LwcAssignment2.getStudents';
import deleteStudents from '@salesforce/apex/LwcAssignment2.deleteStudents';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    //{ label: 'Class', fieldName: 'Class__c', type: 'text' },
    { label: 'Class Name', fieldName: 'class_name', type: 'text' },
    { label: 'Age', fieldName: 'Age__c', type: 'number' },
    { label: 'Email', fieldName: 'Email__c', type: 'email' },
    { type: 'action', typeAttributes: { rowActions: [{ label: 'Edit', name: 'edit_record' }] } }
];

export default class LwcAssignment2 extends LightningElement {
    columns = COLUMNS;
    
    @api selectedSchoolId = '';
    @api selectedClassId = '';
    currentStudentRecordId = '';
    
    @track students = [];
    selectedRows = [];

    isClassDisabled = true;
    isModalOpen = false;
    isLoading = false;


    get hasRecords() {
        return this.students && this.students.length > 0;
    }

    get isDeleteDisabled() {
        return this.selectedRows.length === 0;
    }

    get modalHeaderTitle() {
        return this.currentStudentRecordId ? 'Edit Student Record' : 'Create New Student';
    }

    get classFilter() {
        return {
            criteria: [
                {
                    fieldPath: 'School__c',
                    operator: 'eq',
                    value: this.selectedSchoolId,
                }
            ]
        };
    }

    handleSchoolChange(event) {
        this.selectedSchoolId = event.detail.recordId || '';
        this.selectedClassId = '';
        this.students = [];
        this.isClassDisabled = !this.selectedSchoolId;
    }

    handleClassChange(event) {
        this.selectedClassId = event.detail.recordId || '';
        this.refreshStudentGrid();
    }

    async refreshStudentGrid() {
        if (!this.selectedClassId) {
            this.students = [];
            return;
        }
        try {
            this.isLoading = true
            const rawStudents = await getStudents({ classId: this.selectedClassId });
            this.students = rawStudents.map(student =>{
                return{
                    ...student,
                    class_name: student.Class__r ? student.Class__r.Name : ''
                };
            });
            console.log('Flattened data for datatable>>>>', JSON.stringify(this.students));
        } catch (error) {
            this.showToast('Error', 'Failed to load students.', 'error');
        } finally {
            this.isLoading = false;
        }
    }

    handleNewStudentClick() {
        this.currentStudentRecordId = '';
        this.isModalOpen = true;
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const rowId = event.detail.row.Id;

        if (actionName === 'edit_record') {
            this.currentStudentRecordId = rowId;
            this.isModalOpen = true;
        }
    }

    closeFormModal() {
        this.isModalOpen = false;
        this.currentStudentRecordId = '';
    }

    handleFormSuccess() {
        this.closeFormModal();
        this.showToast('Success', 'Student record processed successfully.', 'success');
        this.refreshStudentGrid();
    }

    handleFormError(event) {
        this.showToast('Error', event.detail.message, 'error');
    }

    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
    }

    async handleBulkDelete() {
        try {
            this.isLoading = true;
            const idsToDelete = this.selectedRows.map(row => row.Id);
            await deleteStudents({ studentIds: idsToDelete });
            this.showToast('Success', 'Selected records deleted successfully.', 'success');
            this.selectedRows = [];
            this.refreshStudentGrid();
        } catch (error) {
            this.showToast('Error', 'Failed to delete records.', 'error');
        } finally {
            this.isLoading = false;
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}