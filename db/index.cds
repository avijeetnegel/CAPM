using { avijeet.db.master, avijeet.db.transaction } from './datamodel';
 

annotate transaction.purchaseorder with{
        
        NODE_KEY @title : '{i18n>NODE_KEY}';
        PO_ID @title : '{i18n>PO_ID}';
        PARTNER_GUID @title : '{i18n>PARTNER_GUID}';
        LIFECYCLE_STATUS @title : '{i18n>LIFECYCLE_STATUS}';
        OVERALL_STATUS @title : '{i18n>OVERALL_STATUS}';
        NOTE @title : '{i18n>NOTE}';
        CURRENCY_CODE @title : '{i18n>CURRENCY_CODE}';
        GROSS_AMOUNT @title : '{i18n>GROSS_AMOUNT}';
        NET_AMOUNT @title : '{i18n>NET_AMOUNT}';
        TAX_AMOUNT @title : '{i18n>TAX_AMOUNT}';
    }

    annotate transaction.poitems with{
        NODE_KEY @title : '{i18n>NODE_KEY}';
        PARENT_KEY @title : '{i18n>PARENT_KEY}';
        PO_ITEM_POS @title : '{i18n>PO_ITEM_POS}';
        PRODUCT_GUID @title : '{i18n>PRODUCT_GUID}';
        CURRENCY_CODE @title : '{i18n>CURRENCY_CODE}';
        GROSS_AMOUNT @title : '{i18n>GROSS_AMOUNT}';
        NET_AMOUNT @title : '{i18n>NET_AMOUNT}';
        TAX_AMOUNT @title : '{i18n>TAX_AMOUNT}';
    }

