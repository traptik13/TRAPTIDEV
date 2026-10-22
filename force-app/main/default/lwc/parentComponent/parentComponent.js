import { LightningElement } from 'lwc';
import MyModal from 'c/myModal';


export default class ParentComponent extends LightningElement {


    async openModal() {
        const result = await MyModal.open({
            size: 'small', // small | medium | large
            description: 'Edit Record Modal',
            recordId: '001XXXXXXXXXXXX'
        });


        if (result === 'cancel') {
            console.log('Modal cancelled');
        }
        else if (result?.status === 'success') {
            console.log('Modal saved');
            console.log('Record Id:', result.recordId);
            console.log('Name:', result.name);
        }
    }
}