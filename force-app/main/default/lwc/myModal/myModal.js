import LightningModal from 'lightning/modal';
import { api, track } from 'lwc';


export default class MyModal extends LightningModal {
    @api recordId;
    @track name = '';


    handleChange(event) {
        this.name = event.target.value;
    }


    handleClose() {
        this.close('cancel');
    }


    handleSave() {
        this.close({
            status: 'success',
            name: this.name,
            recordId: this.recordId
        });
    }
}