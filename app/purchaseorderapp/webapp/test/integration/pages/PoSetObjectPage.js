sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'avijeet.app.purchaseorderapp',
            componentId: 'PoSetObjectPage',
            contextPath: '/PoSet'
        },
        CustomPageDefinitions
    );
});