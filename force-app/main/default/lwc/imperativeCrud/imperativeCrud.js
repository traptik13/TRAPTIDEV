import { LightningElement } from 'lwc';

import getAccounts
    from '@salesforce/apex/ImperativeApexController.getAccounts';

import createAccount
    from '@salesforce/apex/ImperativeApexController.createAccount';

import updateAccount
    from '@salesforce/apex/ImperativeApexController.updateAccount';

import deleteAccount
    from '@salesforce/apex/ImperativeApexController.deleteAccount';


export default class ImperativeCrud extends LightningElement {

    accounts;

    accountName = '';
    accountId = '';
    newName = '';


    // =========================
    // FETCH
    // =========================

    handleFetch() {

        getAccounts()

            .then(result => {

                this.accounts = result;

            })

            .catch(error => {

                console.error(error);

            });
    }


    // =========================
    // INPUT HANDLERS
    // =========================

    handleNameChange(event) {

        this.accountName = event.target.value;

    }


    handleIdChange(event) {

        this.accountId = event.target.value;

    }


    handleNewNameChange(event) {

        this.newName = event.target.value;

    }


    // =========================
    // INSERT
    // =========================

    handleInsert() {

        createAccount({

            accountName: this.accountName

        })

        .then(result => {

            console.log('Account Created:', result);

        })

        .catch(error => {

            console.error(error);

        });
    }


    // =========================
    // UPDATE
    // =========================

    handleUpdate() {

        updateAccount({

            accountId: this.accountId,

            newName: this.newName

        })

        .then(result => {

            console.log('Account Updated:', result);

        })

        .catch(error => {

            console.error(error);

        });
    }


    // =========================
    // DELETE
    // =========================

    handleDelete() {

        deleteAccount({

            accountId: this.accountId

        })

        .then(() => {

            console.log('Account Deleted');

        })

        .catch(error => {

            console.error(error);

        });
    }
}