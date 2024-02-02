@isTest
private class TestClass {
   public static testMethod void testRunAs() {
          
            List<User> us = [SELECT Id FROM User WHERE UserName = 'community@payments-testim.org'];
            System.Debug('size=' + us.size());
            
            bt_stripe__Sales_Document__c sd = new bt_stripe__Sales_Document__c(bt_stripe__Name__c='test');
            insert sd;
            
            System.runAs(us[0]) {
                    System.debug('Current User: ' + UserInfo.getUserName());
                System.debug('Current Profile: ' + UserInfo.getProfileId());
                    List<bt_stripe__Sales_Document__c> accountsWithContacts = [SELECT bt_stripe__additional_discount_amount__c, bt_stripe__additional_discount_percentage__c, bt_stripe__balance_due_amount__c, bt_stripe__balance_paid_amount__c, bt_stripe__company__c, bt_stripe__currency_iso__c, bt_stripe__discount_amount__c, bt_stripe__discount_code__c, bt_stripe__documentlink__c, bt_stripe__due_date__c, bt_stripe__eligible_id__c, bt_stripe__email__c, bt_stripe__expiration_date__c, id, bt_stripe__issue_date__c, bt_stripe__location__c, name, bt_stripe__name__c, bt_stripe__paid_in_full__c, bt_stripe__payment_gateway__c, bt_stripe__payment_gateway_paypal__c, bt_stripe__payment_status__c, bt_stripe__payment_term__c, bt_stripe__po_number__c, bt_stripe__net_amount__c, ownerid, bt_stripe__phone__c, recordtypeid, bt_stripe__status__c, bt_stripe__subject__c, bt_stripe__subtotal_amount__c, bt_stripe__tax_amount__c, bt_stripe__tax_rate__c, bt_stripe__total_amount__c, bt_stripe__bill_to_name__c, bt_stripe__bill_to_first_name__c, bt_stripe__bill_to_last_name__c, bt_stripe__bill_to_street__c, bt_stripe__bill_to_city__c, bt_stripe__bill_to_state__c, bt_stripe__bill_to_postal_code__c, bt_stripe__bill_to_country__c, bt_stripe__ship_to_name__c, bt_stripe__ship_to_first_name__c, bt_stripe__ship_to_last_name__c, bt_stripe__ship_to_street__c, bt_stripe__ship_to_city__c, bt_stripe__ship_to_state__c, bt_stripe__ship_to_postal_code__c, bt_stripe__ship_to_country__c, bt_stripe__customer_reference__c, bt_stripe__subscription__c, bt_stripe__ship_from_postal_code__c, bt_stripe__shipping_amount__c, bt_stripe__bill_to__c, bt_stripe__ship_to__c, bt_stripe__ship_to_contact__c, bt_stripe__bill_to_contact__c, bt_stripe__contact__c, bt_stripe__contact__r.name, bt_stripe__contact__r.email, bt_stripe__contact__r.phone, bt_stripe__discount_code__r.name, bt_stripe__discount_code__r.bt_stripe__type__c, bt_stripe__discount_code__r.bt_stripe__description__c, bt_stripe__discount_code__r.bt_stripe__discount_amount__c, bt_stripe__discount_code__r.bt_stripe__discount_percentage__c, bt_stripe__discount_code__r.bt_stripe__valid_from__c, bt_stripe__discount_code__r.bt_stripe__valid_through__c, bt_stripe__discount_code__r.bt_stripe__quantity_available__c, bt_stripe__discount_code__r.bt_stripe__quantity_claimed__c, bt_stripe__discount_code__r.bt_stripe__quantity_remaining__c, bt_stripe__discount_code__r.bt_stripe__restrict_to_account__c, ( SELECT bt_stripe__sales_document__c, bt_stripe__code__c, bt_stripe__code_discount_amount__c, bt_stripe__description__c, bt_stripe__discount_amount__c, bt_stripe__additional_discount_amount__c, bt_stripe__additional_discount_percentage__c, id, name, bt_stripe__net_amount__c, bt_stripe__list_price__c, bt_stripe__quantity__c, bt_stripe__subtotal_amount__c, bt_stripe__tax_rate__c, bt_stripe__total_amount__c, bt_stripe__unit_price__c, bt_stripe__sort_order__c, bt_stripe__item_code__c, bt_stripe__related_key__c, bt_stripe__uom__c, bt_stripe__tax_amount__c, bt_stripe__service_start_date__c, bt_stripe__service_end_date__c, bt_stripe__item_name__c, bt_stripe__product__c, bt_stripe__price_book__c, bt_stripe__product__r.name, bt_stripe__product__r.productcode, bt_stripe__product__r.description, bt_stripe__code__r.name, bt_stripe__code__r.bt_stripe__type__c, bt_stripe__code__r.bt_stripe__description__c, bt_stripe__code__r.bt_stripe__discount_amount__c, bt_stripe__code__r.bt_stripe__discount_percentage__c, bt_stripe__code__r.bt_stripe__valid_from__c, bt_stripe__code__r.bt_stripe__valid_through__c, bt_stripe__code__r.bt_stripe__quantity_available__c, bt_stripe__code__r.bt_stripe__quantity_claimed__c, bt_stripe__code__r.bt_stripe__quantity_remaining__c, bt_stripe__code__r.bt_stripe__restrict_to_account__c, recordtypeid, bt_stripe__sales_document__r.id, bt_stripe__sales_document__r.name, bt_stripe__sales_document__r.bt_stripe__name__c, bt_stripe__sales_document__r.bt_stripe__company__c, bt_stripe__sales_document__r.bt_stripe__bill_to__c, bt_stripe__sales_document__r.bt_stripe__currency_iso__c, bt_stripe__sales_document__r.bt_stripe__status__c, conference360__event_item__c, conference360__event_item_session__c FROM bt_stripe__Sales_Document_Items2__r ), ( SELECT bt_stripe__amount__c, bt_stripe__currency_iso__c, bt_stripe__transaction_status__c, bt_stripe__payment_status__c, bt_stripe__retained_revenue_amount__c, bt_stripe__transaction_type__c, bt_stripe__sales_document__c, recordtypeid FROM bt_stripe__Transactions__r ), conference360__event__c FROM bt_stripe__Sales_Document__c];
                    // Strip fields that are not readable
                    SObjectAccessDecision decision = Security.stripInaccessible(
                        AccessType.READABLE,
                        accountsWithContacts);
                    // Print stripped records
                    System.Debug('accountsWithContacts=' + accountsWithContacts.size());
                    for (Integer i = 0; i < accountsWithContacts.size(); i++)
                    {
                        System.debug('Insecure record access: '+accountsWithContacts[i]);
                        System.debug('Secure record access: '+decision.getRecords()[i]);
                    }
                    // Print modified indexes
                    System.debug('Records modified by stripInaccessible: '+decision.getModifiedIndexes());
                    // Print removed fields
                    System.debug('Fields removed by stripInaccessible: '+decision.getRemovedFields());
            }
    }
}