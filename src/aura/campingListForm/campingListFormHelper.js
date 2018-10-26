({
    createItem: function (component, event, helper) {
        var item = component.get("v.newItem");
        var addItemEvent = component.getEvent("addItem");
        addItemEvent.setParams({ "item": item });
        addItemEvent.fire();

        component.set("v.newItem", {
            'sobjectType': 'Camping_Item__c',
            'Name': '',
            'Quantity__c': 0,
            'Price__c': 0,
            'Packed__c': false
        });

    }
})