import { LightningElement } from 'lwc';

export default class SampleHelloWorld extends LightningElement {
    hasError = false;     // Boolean to track error state
    errorMessage = '';    // To display error message
    stack = '';           // Optional stack info

    // This will be called if a child component throws an error
    errorCallback(error, stack) {
        console.log('ErrorCallback called =>', error, stack);
        this.hasError = true;
        this.errorMessage = error.message;
        this.stack = stack;
    }
}