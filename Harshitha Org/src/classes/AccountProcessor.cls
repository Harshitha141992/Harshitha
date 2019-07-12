global class AccountProcessor {
  @future
  public static void countContacts(set<Id> recordIds) {
    List<Account> accounts = [Select Id, Number_of_Contacts__c,(SELECT Id FROM Contacts) from Account Where Id IN :recordIds];
    FOR(Account acc : accounts){
        List<Contact> contactList = acc.Contacts;
        acc.Number_of_Contacts__c = contactList.size();
        
    }
    update accounts;
  }
}