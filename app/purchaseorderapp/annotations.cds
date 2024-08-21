using { CatalogService  } from '../../srv/CatalogService';


annotate CatalogService.PoSet with @(
 UI : {
        SelectionFields: [
            PO_ID,
            GROSS_AMOUNT,
            LIFECYCLE_STATUS,
            CURRENCY_CODE

        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
             {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
             {
                $Type : 'UI.DataFieldForAction',
                Label : 'Boost',
                
                Action : 'CatalogService.boost',
                Inline: true
            },
             {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            },
             {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
             {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
                Criticality:Criticality,
                CriticalityRepresentation:#WithIcon
            },
        ],

        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>purchaseorder}',
            TypeNamePlural : '{i18n>purchaseorders}',
            Title : {
                Label : '{i18n>PO_ID}',
                Value : PO_ID
            },
            Description : {
                Label : '{i18n>DESC}',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
            ImageUrl : 'https://udemy-certificate.s3.amazonaws.com/image/UC-da5646e3-750c-41a2-a4bd-1892e8349e78.jpg'
        
        },

        Facets  : [{
            $Type: 'UI.ReferenceFacet',
            Label : 'Purchase Order General Info',
            Target : '@UI.FieldGroup#HeaderGeneralInfo',
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label : 'Purchase Order Item Info',
            Target : 'Items/@UI.LineItem',
        }],
        FieldGroup#HeaderGeneralInfo  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : PO_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID_NODE_KEY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID.COMPANY_NAME,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID.BP_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : GROSS_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : TAX_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : CURRENCY_CODE,
                },
                {
                    $Type : 'UI.DataField',
                    Value : NET_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : LIFECYCLE_STATUS,
                },
            ],
            
        },

        
    }

);
 
annotate CatalogService.POItems with @(

UI:
     { LineItem  : [
                        {
                            $Type : 'UI.DataField',
                            Value : PO_ITEM_POS,
                        },
                        {
                            $Type : 'UI.DataField',
                            Value : PRODUCT_GUID_NODE_KEY,
                        },
                        {
                            $Type : 'UI.DataField',
                            Value : PRODUCT_GUID.PRODUCT_ID,
                        },
                        {
                            $Type : 'UI.DataField',
                            Value : GROSS_AMOUNT,
                        },
                   ],
        },

         HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order Item',
            TypeNamePlural : 'Purchase Order Items',
            Title : {
                $Type : 'UI.DataField',
                Value : ID
            },
            Description : {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            ImageUrl : 'https://udemy-certificate.s3.amazonaws.com/image/UC-da5646e3-750c-41a2-a4bd-1892e8349e78.jpg'
        
        },


);
 



