using { avijeet.db.CDSViews } from '../db/CDSViews';
using { avijeet.db.master ,avijeet.db.transaction  } from '../db/datamodel';


service CDSService {
    entity POWorkList as projection on CDSViews.POWorklist;
    entity ProductOrders as projection on CDSViews.ProductViewSub;
    entity ProductAggregation as projection on CDSViews.CProductValuesView;
 
}


