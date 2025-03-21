using{  avijeet.db.master ,avijeet.db.transaction } from '../db/datamodel';
service CatalogService@(path : '/CatalogService') {

@Capabilities:{
    Insertable,
    Updatable:true,
    Deletable
}
entity EmployeeSet as projection on master.employees;
@readonly
entity BPSet as projection on master.businesspartner;
entity AddressSet as projection on master.address;
entity ProductSet as projection on master.product;
// entity ProductText as projection on transaction.poitems;
// entity PoSets as projection on transaction.purchaseorder;
// entity POItems as projection on transaction.poitems;
    


entity PoSet @(title : 'PO HEADER',
odata.draft.enabled:true ) as projection 
on transaction.purchaseorder{
    * , 
    round(GROSS_AMOUNT,2) as GROSS_AMOUNT:Decimal(15,2),
    case LIFECYCLE_STATUS
    when 'N' then 'New'
    when 'D' then 'Delivered'
    when 'B' then 'Blocked'
    end as LIFECYCLE_STATUS:String(20),

    case LIFECYCLE_STATUS 
    when 'N' then 2
    when 'D' then 1
    when 'B' then 3
    end as Criticality:Integer,
    Items: redirected to POItems
}actions{
    function largestOrder() returns array of PoSet;
    action boost();
} 

entity POItems @(title : 'PO Items') 
as projection on transaction.poitems{
    * , 
    PARENT_KEY: redirected to PoSet ,
    PRODUCT_GUID: redirected to ProductSet 
} 
}

