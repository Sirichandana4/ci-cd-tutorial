@isTest(SeeAllData=true)
private class TestCheckPermissions {
    public static testMethod void testRunAs() {
        // Setup test data
        // This code runs as the system user
		/*bt_stripe__Relationship_Settings__c setting = new bt_stripe__Relationship_Settings__c();
		setting.bt_stripe__Match_Records__c='Contact;Lead;Account';
		setting.bt_stripe__Relationship_Rule__c = 'Create New Record If No Match';
		setting.bt_stripe__Create_Rule__c = 'Contact';
		setting.bt_stripe__Contact_Account_Rule__c = 'Create Account';
		setting.bt_stripe__Set_All_Email_Fields__c = true;
		insert setting;

		
		bt_stripe__Payment_Gateway__c pg = new bt_stripe__Payment_Gateway__c(
			bt_stripe__Provider__c = 'Stripe',
			bt_stripe__Stripe_User_Id__c = 'xx',
			bt_stripe__Default__c = true,
			bt_stripe__Webhook_Label__c = 'kutyus',
			bt_stripe__Stripe_Publishable_Key__c = 'dummy_publishable_key',
			bt_stripe__Default_Currency__c = 'USD',
			bt_stripe__Test_Mode__c = true,
			bt_stripe__Relationship_Settings__c = setting.Id
		);
        insert pg;
        	Contact	contact = new Contact(
			FirstName = 'Harry',
			LastName = 'Potter',
			Email = 'harry.p@blackthorn.io');
			insert contact;
        	bt_stripe__Stripe_Customer__c	customer = new bt_stripe__Stripe_Customer__c(
			Name = 'My Customer',
			bt_stripe__Description__c = 'My Customer',
			bt_stripe__Email__c = 'email@cus.com',
			bt_stripe__Payment_Gateway__c = pg.Id);
        customer.bt_stripe__Customer_Id__c = 'cus_EOaIaKcVJ8Bwgb';
                insert customer;
        		bt_stripe__Sales_Document__c sd = new bt_stripe__Sales_Document__c(bt_stripe__Customer__c = customer.Id,bt_stripe__Status__c='Draft',bt_stripe__Days_Until_Due__c=10,bt_stripe__Billing_Method__c='send_invoice');
		sd.RecordTypeId = Schema.SObjectType.bt_stripe__Sales_Document__c.getRecordTypeInfosByDeveloperName().get('StripeInvoice').getRecordTypeId();
		insert sd;*/
        
        
        
        User u1 = [SELECT Id FROM User WHERE UserName = 'standard@payments-testim.org' LIMIT 1];
        System.Debug('u1=' + u1);

        System.runAs(u1) {
            // The following code runs as user 'u' 
            SObjectAccessDecision securityDecision = 
         Security.stripInaccessible(AccessType.READABLE,
                 [SELECT bt_stripe__additional_discount_amount__c, bt_stripe__additional_discount_percentage__c, bt_stripe__balance_due_amount__c, bt_stripe__balance_paid_amount__c, bt_stripe__company__c, bt_stripe__currency_iso__c, bt_stripe__discount_amount__c, bt_stripe__discount_code__c, bt_stripe__documentlink__c, bt_stripe__due_date__c, bt_stripe__eligible_id__c, bt_stripe__email__c, bt_stripe__expiration_date__c, bt_stripe__fee_amount__c, id, bt_stripe__issue_date__c, bt_stripe__location__c, name, bt_stripe__name__c, bt_stripe__paid_in_full__c, bt_stripe__payment_gateway__c, bt_stripe__payment_gateway_paypal__c, bt_stripe__payment_status__c, bt_stripe__payment_term__c, bt_stripe__po_number__c, bt_stripe__net_amount__c, ownerid, bt_stripe__phone__c, recordtypeid, bt_stripe__status__c, bt_stripe__subject__c, bt_stripe__subtotal_amount__c, bt_stripe__tax_amount__c, bt_stripe__tax_rate__c, bt_stripe__total_amount__c, bt_stripe__bill_to_name__c, bt_stripe__bill_to_first_name__c, bt_stripe__bill_to_last_name__c, bt_stripe__bill_to_street__c, bt_stripe__bill_to_city__c, bt_stripe__bill_to_state__c, bt_stripe__bill_to_postal_code__c, bt_stripe__bill_to_country__c, bt_stripe__ship_to_name__c, bt_stripe__ship_to_first_name__c, bt_stripe__ship_to_last_name__c, bt_stripe__ship_to_street__c, bt_stripe__ship_to_city__c, bt_stripe__ship_to_state__c, bt_stripe__ship_to_postal_code__c, bt_stripe__ship_to_country__c, bt_stripe__customer_reference__c, bt_stripe__subscription__c, bt_stripe__ship_from_postal_code__c, bt_stripe__shipping_amount__c, bt_stripe__customer__c, bt_stripe__customer__r.bt_stripe__customer_id__c, bt_stripe__customer__r.bt_stripe__payment_gateway__c, bt_stripe__customer__r.bt_stripe__email__c, bt_stripe__bill_to__c, bt_stripe__ship_to__c, bt_stripe__ship_to_contact__c, bt_stripe__bill_to_contact__c, bt_stripe__contact__c, bt_stripe__contact__r.name, bt_stripe__contact__r.email, bt_stripe__contact__r.phone, bt_stripe__bill_to_lead__c, bt_stripe__ship_to_lead__c, bt_stripe__opportunity__c, bt_stripe__discount_code__r.name, bt_stripe__discount_code__r.bt_stripe__type__c, bt_stripe__discount_code__r.bt_stripe__description__c, bt_stripe__discount_code__r.bt_stripe__discount_amount__c, bt_stripe__discount_code__r.bt_stripe__discount_percentage__c, bt_stripe__discount_code__r.bt_stripe__valid_from__c, bt_stripe__discount_code__r.bt_stripe__valid_through__c, bt_stripe__discount_code__r.bt_stripe__quantity_available__c, bt_stripe__discount_code__r.bt_stripe__quantity_claimed__c, bt_stripe__discount_code__r.bt_stripe__quantity_remaining__c, bt_stripe__discount_code__r.bt_stripe__restrict_to_account__c, ( SELECT bt_stripe__sales_document__c, bt_stripe__code__c, bt_stripe__code_discount_amount__c, bt_stripe__description__c, bt_stripe__discount_amount__c, bt_stripe__additional_discount_amount__c, bt_stripe__additional_discount_percentage__c, id, bt_stripe__isnotdiscountable__c, bt_stripe__is_payment_processing_fee__c, name, bt_stripe__net_amount__c, bt_stripe__list_price__c, bt_stripe__quantity__c, bt_stripe__subtotal_amount__c, bt_stripe__tax_rate__c, bt_stripe__total_amount__c, bt_stripe__unit_price__c, bt_stripe__sort_order__c, bt_stripe__item_code__c, bt_stripe__related_key__c, bt_stripe__uom__c, bt_stripe__tax_amount__c, bt_stripe__service_start_date__c, bt_stripe__service_end_date__c, bt_stripe__item_name__c, bt_stripe__stripe_invoice_item_id__c, bt_stripe__balance_due_amount__c, bt_stripe__balance_paid_amount__c, bt_stripe__amount_refunded__c, bt_stripe__product__c, bt_stripe__price_book__c, bt_stripe__plan__c, bt_stripe__plan__r.name, bt_stripe__plan__r.bt_stripe__currency__c, bt_stripe__plan__r.bt_stripe__interval__c, bt_stripe__plan__r.bt_stripe__active__c, bt_stripe__plan__r.bt_stripe__usage_type__c, bt_stripe__plan__r.bt_stripe__tiers_mode__c, bt_stripe__plan__r.bt_stripe__trial_period_days__c, bt_stripe__plan__r.bt_stripe__interval_count__c, bt_stripe__plan__r.bt_stripe__billing_scheme__c, bt_stripe__plan__r.bt_stripe__aggregate_usage__c, bt_stripe__plan__r.bt_stripe__amount__c, bt_stripe__plan__r.bt_stripe__plan_id__c, bt_stripe__plan__r.bt_stripe__product__c, bt_stripe__product__r.name, bt_stripe__product__r.productcode, bt_stripe__product__r.description, bt_stripe__product__r.bt_stripe__product_id__c, bt_stripe__product__r.bt_stripe__type__c, bt_stripe__code__r.name, bt_stripe__code__r.bt_stripe__type__c, bt_stripe__code__r.bt_stripe__description__c, bt_stripe__code__r.bt_stripe__discount_amount__c, bt_stripe__code__r.bt_stripe__discount_percentage__c, bt_stripe__code__r.bt_stripe__valid_from__c, bt_stripe__code__r.bt_stripe__valid_through__c, bt_stripe__code__r.bt_stripe__quantity_available__c, bt_stripe__code__r.bt_stripe__quantity_claimed__c, bt_stripe__code__r.bt_stripe__quantity_remaining__c, bt_stripe__code__r.bt_stripe__restrict_to_account__c, recordtypeid, bt_stripe__sales_document__r.id, bt_stripe__sales_document__r.name, bt_stripe__sales_document__r.bt_stripe__name__c, bt_stripe__sales_document__r.bt_stripe__company__c, bt_stripe__sales_document__r.bt_stripe__bill_to__c, bt_stripe__sales_document__r.bt_stripe__currency_iso__c, bt_stripe__sales_document__r.bt_stripe__status__c, conference360__event_item__c, conference360__event_item_session__c FROM bt_stripe__Sales_Document_Items2__r ), ( SELECT bt_stripe__amount__c, bt_stripe__currency_iso__c, bt_stripe__transaction_status__c, bt_stripe__payment_status__c, bt_stripe__retained_revenue_amount__c, bt_stripe__transaction_type__c, bt_stripe__sales_document__c, recordtypeid, bt_stripe__stripe_customer__c FROM bt_stripe__Transactions__r ), conference360__event__c FROM bt_stripe__Sales_Document__c WHERE Id IN ( 'a0V5e00000L707YEAR' )]
                 );
System.debug(securityDecision.getRemovedFields());
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId()); 
        }
    }
}