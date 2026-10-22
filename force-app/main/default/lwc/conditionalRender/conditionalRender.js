import { LightningElement } from 'lwc';
// Import BOTH templates
import defaultTemplate from './conditionalRender.html';
import alternateTemplate from './conditionalRenderAlt.html';
export default class ConditionalRender extends LightningElement {
    isAlternate = false;
    switchTemplate() {
        this.isAlternate = !this.isAlternate;
    }
    // render() method
    render() {
        return this.isAlternate ? alternateTemplate : defaultTemplate;
    }
}