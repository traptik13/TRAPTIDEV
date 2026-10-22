import { LightningElement, track } from 'lwc';

export default class TrackDecorator extends LightningElement {

    @track user = {
        name: 'John Doe'
    };

    handleNameChange(event) {
        this.user.name = event.target.value;
    }
}