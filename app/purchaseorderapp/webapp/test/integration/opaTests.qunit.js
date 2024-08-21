sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'avijeet/app/purchaseorderapp/test/integration/FirstJourney',
		'avijeet/app/purchaseorderapp/test/integration/pages/PoSetList',
		'avijeet/app/purchaseorderapp/test/integration/pages/PoSetObjectPage',
		'avijeet/app/purchaseorderapp/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, PoSetList, PoSetObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('avijeet/app/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePoSetList: PoSetList,
					onThePoSetObjectPage: PoSetObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);