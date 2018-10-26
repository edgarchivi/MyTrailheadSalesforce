({
    clickCreateItem: function (component, event, helper) {
        //if the form is valid
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if (validCamping) {
            helper.createItem(component, event, helper);
        }
    }

})