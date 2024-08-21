namespace avijeet.db;

using { sap,cuid,Currency,temporal,managed  } from '@sap/cds/common';
using { avijeet.common } from './common';


context master {
    
    
    entity businesspartner { 
        key NODE_KEY:common.Guid;
        BP_ROLE:String(2);
        EMAIL_ADDRESS:String(64);
        PHONE_NUMBER:String(14);
        FAX_NUMBER:String(14);
        WEB_ADDRESS:String(64);
        ADDRESS_GUID: Association to address;	
        BP_ID:String(16);
        COMPANY_NAME:String(80);
    }
    annotate businesspartner with{
        NODE_KEY @title : '{i18n>NODE_KEY}';
        BP_ROLE @title : '{i18n>BP_ROLE}';
        EMAIL_ADDRESS @title : '{i18n>EMAIL_ADDRESS}';
        PHONE_NUMBER @title : '{i18n>PHONE_NUMBER}';
        FAX_NUMBER @title : '{i18n>FAX_NUMBER}';
        WEB_ADDRESS @title : '{i18n>WEB_ADDRESS}';
        ADDRESS_GUID @title : '{i18n>ADDRESS_GUID_NODE_KEY}';
        BP_ID @title : '{i18n>BP_ID}';
        COMPANY_NAME @title : '{i18n>COMPANY_NAME}';
    }
    
    

     entity address {
         key NODE_KEY:common.Guid;
        CITY:String(120);
        POSTAL_CODE:String(60);
        STREET:String(120);
        BUILDING:String(128);
        COUNTRY:String(44);
        ADDRESS_TYPE:String(20);
        VAL_START_DATE:Date;
        VAL_END_DATE:Date;
        LATITUDE:Decimal;
        LONGITUDE:Decimal;
    }
    entity product {
         key NODE_KEY:common.Guid;
        PRODUCT_ID: String(28);
        TYPE_CODE: String(2);
        CATEGORY: String(32);
        DESCRIPTION: localized String(255);
        SUPPLIER_GUID: Association to master.businesspartner;
        TAX_TARIF_CODE: Integer;
        MEASURE_UNIT: String(2);
        WEIGHT_MEASURE	: Decimal(5,2);
        WEIGHT_UNIT: String(2);
        CURRENCY_CODE:String(4);
        PRICE: Decimal(15,2);
        WIDTH:Decimal(5,2);	
        DEPTH:Decimal(5,2);	
        HEIGHT:	Decimal(5,2);
        DIM_UNIT:String(2);

    }

    
    entity employees: cuid {
        nameFirst: String(40);
        nameMiddle: String(40);	
        nameLast: String(40);	
        nameInitials: String(40);	
        sex	: common.Gender;
        language: String(1);
        phoneNumber: common.PhoneNumber;
        email: common.Email;
        loginName: String(12);
        Currency: Currency;
        salaryAmount: common.AmountT;	
        accountNumber: String(16);	
        bankId: String(20);
        bankName: String(64);
    }

}

context transaction {
    
     entity purchaseorder: common.Amount ,cuid {
            // key NODE_KEY:common.Guid;
            PO_ID: String(24);     	
            PARTNER_GUID: association to master.businesspartner;                      
            LIFECYCLE_STATUS: String(1);	
            OVERALL_STATUS: String(1);
            Items: association [1..*] to poitems on Items.PARENT_KEY = $self;
            NOTE : String(256);
     }

     entity poitems: common.Amount , cuid {
            // key NODE_KEY: common.Guid;        	
            PARENT_KEY: association [1] to purchaseorder;
            PO_ITEM_POS: Integer;	
            PRODUCT_GUID: association to master.product 
              
     }

}