import { LightningElement } from 'lwc';
export default class Callback extends LightningElement {
    constructor(){
        super(); 
      console.log('Inside constructor'); 
  }   
connectedCallback() { 
      console.log('Inside connected callback'); 
  }
disconnectedCallback(){
        console.log('Inside disconnected callback');
    }
}